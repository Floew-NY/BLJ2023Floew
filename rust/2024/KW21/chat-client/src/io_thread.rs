use std::{
    io::{stdout, Read, Result, Write},
    net::TcpStream,
    sync::mpsc::Receiver,
};

use crate::user_input::user_console_input;

pub fn server_connection(
    mut connection: TcpStream,
    userinput_reciever: Receiver<String>,
) -> Result<()> {
    let _ = connection.write(b"b");
    loop {
        let mut buffer = [0; 1];
        match connection.read(&mut buffer) {
            Ok(0) => {
                println!(
                    "connection with {} has been closed.",
                    connection.peer_addr()?
                );
                break;
            }
            Ok(n) => {
                // Process received data
                let _ = connection.write(b"b");
                println!("connected to {}", connection.peer_addr()?);
                println!("read bytes: {} of value {}", n, buffer[0]);
            }
            Err(err) => {
                // Handle read error
                eprintln!("Error reading from socket: {}", err);
                break;
            }
        }
    }
    Ok(())
}
