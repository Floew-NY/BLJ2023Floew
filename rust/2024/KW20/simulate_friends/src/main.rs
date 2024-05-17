use std::{
    io::{stdin, stdout, Result, Write},
    net::TcpStream,
};

fn main() -> Result<()> {
    print!("Please enter the address: ");
    stdout().flush()?;

    let input_addr = user_console_input();

    println!("You're connecting to: {}", input_addr);

    let mut stream = TcpStream::connect(input_addr)?;
    loop {
        let mut message = user_console_input();
        message.push('\n');
        if message.is_empty() {
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
