use std::{
    io::{stdout, Result, Write},
    net::TcpListener,
    sync::mpsc::{channel, Receiver, Sender},
    thread,
};

use crate::{flag_collector::Flags, io_thread::client_connection, shared::Client};

pub fn tcp_server(flags: Flags) -> Result<()> {
    println!("Connect to port: {}", flags.port);

    let mut clients: Vec<Client> = vec![];

    let address = format!("0.0.0.0:{}", flags.port);
    let _ = stdout().flush();

    let chat_server = TcpListener::bind(address).expect("Port already in use.");

    for stream in chat_server.incoming() {
        let (client_sender, client_reciever): (Sender<Client>, Receiver<Client>) = channel();
        thread::spawn(move || -> Result<()> {
            let _ = client_connection(stream?, client_sender);
            Ok(())
        });

        clients.push(client_reciever.recv().expect("Error Retrieving name :("));
    }
    Ok(())
}
