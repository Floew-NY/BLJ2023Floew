mod flag_collector;
mod io_thread;

use flag_collector::get_flags;
use io_thread::client_connection;
use std::{
    io::{Read, Result},
    net::{TcpListener, TcpStream},
    thread,
};
fn main() -> Result<()> {
    let flags = get_flags();

    let address = format!("0.0.0.0:{}", flags.port);
    println!("Connect to: <server_ip>:{}", flags.port);

    let chat_server = TcpListener::bind(address).expect("Port already in use.");

    let mut clients: Vec<Client> = vec![];

    for stream in chat_server.incoming() {
        handle_client(stream?, clients);
    }
    Ok(())
}

fn handle_client(stream: TcpStream, mut clients: Vec<Client>) {
    thread::spawn(move || client_connection(stream));
}
fn get_client_info(stream: TcpStream) -> Client {
    Client {
        address: stream.peer_addr().unwrap().to_string(),
        name: String::from("robert"),
    }
}

struct Client {
    name: String,
    address: String,
}
