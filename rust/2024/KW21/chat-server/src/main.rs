mod flag_collector;
mod io_thread;
mod shared;

use flag_collector::get_flags;
use io_thread::client_connection;
use shared::Client;
use std::{
    fmt::Error,
    io::{stdout, Read, Result, Write},
    net::{TcpListener, TcpStream},
    sync::mpsc::{channel, Receiver, Sender},
    thread,
    time::Duration,
};
fn main() -> Result<()> {
    let flags = get_flags();

    let address = format!("0.0.0.0:{}", flags.port);
    print!("Connect to port: {}", flags.port);
    stdout().flush();

    let chat_server = TcpListener::bind(address).expect("Port already in use.");

    let mut clients: Vec<Client> = vec![];

    for stream in chat_server.incoming() {
        let (client_sender, client_reciever): (Sender<Client>, Receiver<Client>) = channel();
        thread::spawn(move || -> Result<()> {
            let _ = client_connection(stream?, client_sender);
            Ok(())
        });

        clients.push(client_reciever.recv().expect("Error Retrieving name :("));
        for client in clients.iter() {
            println!(
                "Client: {} - {}",
                client.name[..client.name.len() - 1].to_string(),
                client.address
            );
        }
    }
    Ok(())
}

/* fn handle_client(stream: TcpStream, mut clients: &mut Vec<Client>) -> Result<()> {
    /*     clients.push(get_initial_client_info(stream.try_clone()?)?);
     */
    Ok(())
}
 */
/* fn get_initial_client_info(mut stream: TcpStream) -> Result<Client> {
    let mut name: Vec<u8> = vec![];
    loop {
        let mut buff = [0; 1];
        if stream.read(&mut buff)? > 0 {
            name.push(buff[0]);
        }
        if buff[0] == b'\n' {
            break;
        }
        name.push(buff[0]);
    }
    Ok(Client {
        address: stream.peer_addr().unwrap().to_string(),
        name: String::from_utf8(name).unwrap(),
    })
} */
