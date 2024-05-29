use std::{
    io::{Read, Result},
    net::TcpStream,
    sync::mpsc::Sender,
    time::Duration,
};

use crate::shared::Client;

pub fn client_connection(mut stream: TcpStream, client_sender: Sender<Client>) -> Result<()> {
    let client_name = match read_line(&mut stream) {
        Some(message) => message,
        None => {
            return Ok(());
        }
    };
    let _ = client_sender.send(Client {
        name: client_name.clone(),
        address: stream.peer_addr().unwrap().to_string(),
    });
    loop {
        let message = match read_line(&mut stream) {
            Some(message) => message,
            None => {
                return Ok(());
            }
        };
        println!("{}: {}", client_name, message);
    }
}

fn read_line(stream: &mut TcpStream) -> Option<String> {
    let mut line: Vec<u8> = vec![];
    loop {
        let mut buffer = [0; 1];
        match stream.read(&mut buffer) {
            Ok(0) => {
                // Handle Disconnected
                println!(
                    "connection with {} has been closed.",
                    stream.peer_addr().unwrap()
                );
                return None;
            }
            Ok(_n) => {
                // Process received data
                line.push(buffer[0]);
            }
            Err(err) => {
                // Handle read error
                eprintln!("Error reading from socket: {}", err);
                return None;
            }
        }
        if buffer[0] == b'\n' {
            return Some(String::from_utf8(line).expect("Couldnt parse UTF-8"));
        }
    }
}
