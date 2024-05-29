use std::{
    io::{Read, Result, Write},
    net::TcpStream,
};

pub fn client_connection(mut stream: TcpStream) -> Result<()> {
    loop {
        let mut buffer = [0; 1];
        match stream.read(&mut buffer) {
            Ok(0) => {
                println!("connection with {} has been closed.", stream.peer_addr()?);
                break;
            }
            Ok(n) => {
                // Process received data
                let _ = stream.write(b"b");
                println!("connected to {}", stream.peer_addr()?);
                println!("read bytes: {} of value {}", n, buffer[0]);
            }
            Err(err) => {
                // Handle read error
                eprintln!("Error reading from socket: {}", err);
                break;
            }
        }
    }
    Ok(())
}
