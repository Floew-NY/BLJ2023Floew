use std::{
    io::{Read, Result, Write},
    net::TcpStream,
    sync::{
        mpsc::{channel, Receiver, Sender},
        Arc, Mutex,
    },
};

use crate::shared::{Client, Message};

pub fn client_connection(
    mut stream: TcpStream,
    global_message_sender: Sender<Message>,
    clients: Arc<Mutex<Vec<Arc<Client>>>>,
) -> Result<()> {
    let (client_sender, client_reciever): (Sender<String>, Receiver<String>) = channel();
    // grab client name
    let client_name = match read_line(&mut stream) {
        Some(message) => message,
        None => {
            return Ok(());
        }
    };
    let client = Arc::new(Client {
        name: client_name,
        address: stream.peer_addr().unwrap().to_string(),
        message_sender: client_sender,
    });
    {
        // add Client to client list
        let mut unwraped_clients = clients.lock().unwrap();
        unwraped_clients.push(client.clone());
    }

    loop {
        // send message to client
        if let Ok(outgoing_message) = client_reciever.try_recv() {
            let _ = stream.write_all(outgoing_message.as_bytes());
        }
        // recieve message from client
        if check_stream_queue(&mut stream) {
            let message = match read_line(&mut stream) {
                Some(message) => message,
                None => {
                    // remove client on disconnect
                    let mut unwraped_clients = clients.lock().unwrap();
                    remove_client(&mut unwraped_clients, client);
                    return Ok(());
                }
            };
            // send Message to distribution
            let _ = global_message_sender.send(Message {
                content: message,
                author: client.clone(),
            });
        }
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
            return Some(
                String::from_utf8(line[..line.len() - 1].to_vec()).expect("Couldnt parse UTF-8"),
            );
        }
    }
}

fn remove_client(clients: &mut Vec<Arc<Client>>, client: Arc<Client>) {
    if let Some(pos) = clients.iter().position(|x| **x == *client) {
        clients.remove(pos);
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
