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
    print!("Enter your Displayname: ");
    let _ = stdout().flush();
    //send Displayname
    let name = user_console_input();
    loop {
        print!("Enter the server's address: ");
        let _ = stdout().flush();
        let addr = user_console_input();

        println!("Connecting to {}...", addr);
        let _ = stdout().flush();

        let stream = match TcpStream::connect(addr) {
            Ok(con) => con,
            Err(_) => {
                println!("Provided Address didn't work.");
                continue;
            }
        };
        let (is_open_sender, is_open_reciever): (Sender<bool>, Receiver<bool>) = channel();
        let (message_sender, message_reciever): (Sender<String>, Receiver<String>) = channel();
        let net_thread =
            thread::spawn(move || server_connection(stream, message_reciever, is_open_sender));
        let _ = message_sender.send(format!("{}\n", name));
        println!("Successfully Connected");

        loop {
            let _ = message_sender.send(format!("{}\n", user_console_input()));
            if is_open_reciever.try_recv().is_err() {
                continue;
            }
            if is_open_reciever.try_recv().unwrap() == false {
                println!("Connection lost :(");
                break;
            }
        }
        let _ = net_thread.join().expect("couldnt join thread :(");
    }
}
