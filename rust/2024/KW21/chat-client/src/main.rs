mod io_thread;
use std::{
    io::stdin,
    net::TcpStream,
    sync::mpsc::{channel, Receiver, Sender},
    thread,
};

use io_thread::server_connection;

fn main() {
    loop {
        let (sender, reciever): (Sender<String>, Receiver<String>) = channel();
        thread::spawn(move || server_connection(reciever));
    }
}
fn user_console_input() -> String {
    let mut input = String::new();
    stdin()
        .read_line(&mut input)
        .expect("Did not enter a correct string");
    if let Some('\n') = input.chars().next_back() {
        input.pop();
    }
    if let Some('\r') = input.chars().next_back() {
        input.pop();
    }
    input
}
