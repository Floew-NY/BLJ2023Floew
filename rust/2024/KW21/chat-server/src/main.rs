mod flag_collector;
mod io_thread;
mod shared;
mod tcp_server;

use flag_collector::get_flags;
use shared::{Client, Message};
use std::{
    io::{stdout, Read, Result, Write},
    net::{TcpListener, TcpStream},
    sync::{
        mpsc::{channel, Receiver, Sender},
        Arc, Mutex,
    },
    thread::{self, sleep},
};
use tcp_server::tcp_server;
fn main() -> Result<()> {
    let flags = get_flags();

    // shared Client Information
    let unsafe_clients_vector: Vec<Arc<Client>> = vec![];
    let clients: Arc<Mutex<Vec<Arc<Client>>>> = Arc::new(Mutex::new(unsafe_clients_vector));
    let shared_clients = clients.clone();

    let (global_message_sender, global_message_reciever): (Sender<Message>, Receiver<Message>) =
        channel();

    let tcp_server =
        thread::spawn(move || tcp_server(flags, global_message_sender, shared_clients));

    for message in global_message_reciever.iter() {
        // handle incoming message
        let unwraped_clients = clients.lock().unwrap();
        for client in unwraped_clients.iter() {
            if **client != *message.author {
                let _ = client
                    .message_sender
                    .send(format!("[{}]{}\n", message.author.name, message.content));
            }
        }
    }

    Ok(())
}
