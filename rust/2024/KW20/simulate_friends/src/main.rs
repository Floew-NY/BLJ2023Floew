use std::{
    io::{stdin, stdout, Read, Result, Write},
    net::TcpStream,
    thread,
};

fn main() -> Result<()> {
    print!("Please enter the address: ");
    stdout().flush()?;

    let input_addr = user_console_input();

    println!("You're connecting to: {}", input_addr);

    let mut stream = TcpStream::connect(input_addr)?;
    let mut responceStream = stream.try_clone()?;
    let thread_handle = thread::spawn(move || -> Result<()> {
        let mut message: Vec<u8> = vec![];
        loop {
            let mut buff = [0; 1];
            if responceStream.read(&mut buff)? > 0 {
                message.push(buff[0]);
            }
            if buff[0] == b'\n' {
                print!(
                    "message: {}",
                    String::from_utf8(message.clone()).expect("not utf8")
                );
                message.clear();
            }
        }
    });
    loop {
        let mut message = user_console_input();
        message.push('\n');
        if message.is_empty() {
            let _ = thread_handle.join().expect("coulnt join");
            break;
        }
        stream.write(message.as_bytes())?;
        stream.flush()?;
    }
    Ok(())
}

fn user_console_input() -> String {
    let mut input = String::new();
    stdin()
        .read_line(&mut input)
        .expect("Did not enter a correct string");
    if let Some('\n') = input.chars().next_back() {
        input.pop();
    }
    if let Some('\r') = input.chars().next_back() {
        input.pop();
    }
    input
}
