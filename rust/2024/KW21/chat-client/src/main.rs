mod io_thread;
mod user_input;
use std::{
    io::{stdin, stdout, Write},
    net::TcpStream,
    sync::mpsc::{channel, Receiver, Sender},
    thread,
};

use io_thread::server_connection;
use user_input::user_console_input;

fn main() {
    loop {
        print!("Enter the server's address: ");
        let _ = stdout().flush();
        let addr = user_console_input();

        println!("Connecting to {}...", addr);
        let _ = stdout().flush();

        let connection = match TcpStream::connect(addr) {
            Ok(con) => con,
            Err(_) => {
                println!("Provided Address didn't work.");
                continue;
            }
        };

        let (sender, reciever): (Sender<String>, Receiver<String>) = channel();
        let net = thread::spawn(move || server_connection(connection, reciever));
        println!("Successfully Connected");
    }

    /*    print!("Enter your Displayname: ");
    let _ = stdout().flush();
    //send Displayname
    sender.send(user_console_input());
    println!("----chat-client----");
    loop {
        sender.send(user_console_input());
    } */
}
