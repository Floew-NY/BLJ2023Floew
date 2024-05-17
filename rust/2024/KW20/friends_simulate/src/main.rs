use std::io::{stdout, Read, Result, Write};
use std::net::{TcpListener, TcpStream};
use std::thread::sleep;

fn handle_client(mut stream: TcpStream) -> Result<()> {
    println!("{}", stream.peer_addr()?);
    let mut message: Vec<u8> = vec![];
    loop {
        let mut buff = [0; 1];
        if stream.read(&mut buff)? > 0 {
            message.push(buff[0]);
        }
        if buff[0] == b'\n' {
            print!(
                "message: {}",
                String::from_utf8(message.clone()).expect("not utf8")
            );
            message.clear();
        }
    }
}
fn main() -> Result<()> {
    let listener = TcpListener::bind("127.0.0.1:0")?;
    println!("{}", listener.local_addr()?);
    for stream in listener.incoming() {
        handle_client(stream?)?;
    }
    Ok(())
}
