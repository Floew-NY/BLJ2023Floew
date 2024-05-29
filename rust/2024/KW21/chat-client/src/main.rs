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
        stdout().flush();

        let addr = user_console_input();
        println!("Connecting to {}...", addr);
        stdout().flush();

        let mut connection;
        match TcpStream::connect(addr) {
            Ok(con) => connection = con,
            Err(_) => {
                println!("Provided Address didnt work.");
                continue;
            }
        }

        let (sender, reciever): (Sender<String>, Receiver<String>) = channel();
        thread::spawn(move || server_connection(connection, reciever));
        println!("Successfully Connected");
        print!("Enter your Displayname: ");
        stdout().flush();
        //send Displayname
        sender.send(user_console_input());
        println!("----chat-client----");
        loop {
            sender.send(user_console_input());
        }
    }
}
