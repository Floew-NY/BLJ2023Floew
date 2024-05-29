use std::{
    io::{stdout, Write},
    net::TcpStream,
    sync::mpsc::Receiver,
};

use crate::user_input::user_console_input;

pub fn server_connection(mut connection: TcpStream, userinput_reciever: Receiver<String>) {
    loop {
        for outgoing_message in userinput_reciever.iter() {
            println!("message sent: {}", outgoing_message);
            stdout().flush();
            connection.write(outgoing_message.clone().as_bytes());
            connection.flush();
        }
    }
}
