use std::{
    io::{stdout, Result, Write},
    net::TcpListener,
    sync::{mpsc::Sender, Arc, Mutex},
    thread,
};

use crate::{
    flag_collector::Flags,
    io_thread::client_connection,
    shared::{Client, Message},
};

pub fn tcp_server(
    flags: Flags,
    global_message_sender: Sender<Message>,
    clients: Arc<Mutex<Vec<Arc<Client>>>>,
) -> Result<()> {
    println!("Connect to port: {}", flags.port);

    let address = format!("0.0.0.0:{}", flags.port);
    let _ = stdout().flush();

    let chat_server = TcpListener::bind(address).expect("Port already in use.");

    for stream in chat_server.incoming() {
        let instance_sender = global_message_sender.clone();
        let clients = Arc::clone(&clients);
        thread::spawn(move || -> Result<()> {
            let _ = client_connection(stream?, instance_sender, clients);
            Ok(())
        });
    }
    Ok(())
}
