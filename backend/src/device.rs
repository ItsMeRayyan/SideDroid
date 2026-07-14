#[derive(Debug)]
pub struct Device {
    pub id: String,
    pub status: String,
}

#[derive(Debug)]
pub struct DeviceInfo {
    pub serial: String,
    pub model: String,
    pub manufacturer: String,
    pub version: String,
}