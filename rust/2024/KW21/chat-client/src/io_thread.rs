use std::{
    io::{stdout, Read, Result, Write},
    net::TcpStream,
    sync::mpsc::{Receiver, Sender},
};

use crate::user_input::user_console_input;

pub fn server_connection(
    mut stream: TcpStream,
    message_reciever: Receiver<String>,
    is_open_sender: Sender<bool>,
) -> Result<()> {
    let _ = stream.write(
        message_reciever
            .recv()
            .expect("missing Display Name")
            .as_bytes(),
    );
    println!("----chat-client----");
    loop {
        if check_stream_queue(&mut stream) {
            let message = match read_line(&mut stream) {
                Some(message) => message,
                None => {
                    let _ = is_open_sender.send(false);
                    return Ok(());
                }
            };

            println!("{}", message);
        }
        if let Ok(message) = message_reciever.try_recv() {
            let _ = stream.write_all(message.as_bytes());
        };
    }
}

fn check_stream_queue(stream: &mut TcpStream) -> bool {
    let _ = stream.set_nonblocking(true);
    let has_queue = match stream.peek(&mut [0; 1]) {
        Ok(_) => true,
        Err(ref e) if e.kind() == std::io::ErrorKind::WouldBlock => false,
        Err(e) => panic!("encountered IO error: {e}"),
    };
    let _ = stream.set_nonblocking(false);
    has_queue
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
            return Some(
                String::from_utf8(line[..line.len() - 1].to_vec()).expect("Couldnt parse UTF-8"),
            );
        }
    }
}
