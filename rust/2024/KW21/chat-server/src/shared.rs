use std::sync::{mpsc::Sender, Arc};

pub struct Client {
    pub name: String,
    pub address: String,
    pub message_sender: Sender<String>,
}

impl PartialEq for Client {
    fn eq(&self, other: &Self) -> bool {
        self.name == other.name && self.address == other.address
    }
}

impl Eq for Client {}

pub struct Message {
    pub content: String,
    pub author: Arc<Client>,
}
