mod flag_collector;
mod io_thread;
mod shared;
mod tcp_server;

use flag_collector::get_flags;
use io_thread::client_connection;
use shared::Client;
use std::{
    fmt::Error,
    io::{stdout, Read, Result, Write},
    net::{TcpListener, TcpStream},
    sync::mpsc::{channel, Receiver, Sender},
    thread::{self, sleep},
    time::Duration,
};
use tcp_server::tcp_server;
fn main() -> Result<()> {
    let flags = get_flags();

    let mut clients: Vec<Client> = vec![];
    let tcp_server = thread::spawn(move || tcp_server(flags));

    sleep(Duration::from_secs(10000));

    Ok(())
}
