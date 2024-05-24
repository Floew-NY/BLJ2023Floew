use std::env;

pub fn get_flags() -> Flags {
    //set Default Port
    let mut port = 1234;
    let args: Vec<String> = env::args().collect();
    if let Some(index) = args.iter().position(|arg| arg == "--port" || arg == "-p") {
        if let Some(arg) = args.get(index + 1) {
            port = arg.parse().expect("Thats not a valid port");
        }
    }
    Flags { port }
}

pub struct Flags {
    pub port: u16,
}
