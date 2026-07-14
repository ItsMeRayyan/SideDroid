mod adb;
mod device;

fn main() {
    println!("SideDroid Backend");
    println!("================");

    if adb::check_adb() {
        println!("ADB: Found ✓");
    } else {
        println!("ADB: Not found ✗");
        return;
    }

    println!("\nDevices:");

    let devices = adb::list_devices();

    if devices.is_empty() {
        println!("No devices connected");
        return;
    }

    for device in devices {
        println!("\nDevice found!");
        println!("ID: {}", device.id);
        println!("Status: {}", device.status);

        let info = adb::get_device_info(&device.id);

        println!("Manufacturer: {}", info.manufacturer);
        println!("Model: {}", info.model);
        println!("System: {}", info.version);
    }
}