use std::io::{stdin, stdout, Read, Result, Write};
use std::net::{TcpListener, TcpStream};
use std::thread;

fn handle_client(mut stream: TcpStream) -> Result<()> {
    let mut responce_stream = stream.try_clone()?;
    let thread_handler = thread::spawn(move || -> Result<()> {
        let mut message: Vec<u8> = vec![];
        loop {
            let mut buff = [0; 1];
            if stream.read(&mut buff)? > 0 {
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
    println!("{}", responce_stream.peer_addr()?);
    loop {
        let mut message = user_console_input();
        message.push('\n');
        if message.is_empty() {
            break Ok(());
        }
        responce_stream.write(message.as_bytes())?;
        responce_stream.flush()?;
    }
}
fn main() -> Result<()> {
    let listener = TcpListener::bind("0.0.0.0:0")?;
    println!("{}", listener.local_addr()?);
    for stream in listener.incoming() {
        handle_client(stream?)?;
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
