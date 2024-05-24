use std::{io::stdin, net::TcpStream, sync::mpsc::Receiver};

pub fn server_connection(userinput_reciever: Receiver<String>) {
    loop {
        loop {
            print!("Enter the server's address:");
            let addr = user_console_input();
            print!("Enter your displayname:");
            let name = user_console_input();

            let connection;
            match TcpStream::connect(addr) {
                Ok(con) => connection = con,
                Err(_) => {
                    println!("Provided Address didnt work.");
                    continue;
                }
            }
            loop {
                for outgoing_message in userinput_reciever.iter() {}
            }
        }
    }
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

struct Client {
    name: String,
    address: String,
}
