use std::process::Command;
use crate::device::{Device, DeviceInfo};

pub fn check_adb() -> bool {
    let result = Command::new("adb")
        .arg("version")
        .output();

    match result {
        Ok(output) => output.status.success(),
        Err(_) => false,
    }
}

pub fn list_devices() -> Vec<Device> {
    let result = Command::new("adb")
        .arg("devices")
        .output();

    let output = match result {
        Ok(output) => String::from_utf8_lossy(&output.stdout).to_string(),
        Err(_) => return Vec::new(),
    };

    let mut devices = Vec::new();

    for line in output.lines() {
        if line.ends_with("device") && !line.starts_with("List") {
            let parts: Vec<&str> = line.split_whitespace().collect();

            if parts.len() >= 2 {
                devices.push(Device {
                    id: parts[0].to_string(),
                    status: parts[1].to_string(),
                });
            }
        }
    }

    devices
}

pub fn get_device_info(serial: &str) -> DeviceInfo {
    let model = run_adb_command(serial, "ro.product.model");
    let manufacturer = run_adb_command(serial, "ro.product.manufacturer");
    let version = run_adb_command(serial, "ro.build.version.release");

    DeviceInfo {
        serial: serial.to_string(),
        model,
        manufacturer,
        version,
    }
}

fn run_adb_command(serial: &str, property: &str) -> String {
    let output = Command::new("adb")
        .args([
            "-s",
            serial,
            "shell",
            "getprop",
            property,
        ])
        .output();

    match output {
        Ok(result) => {
            let value = String::from_utf8_lossy(&result.stdout)
                .trim()
                .to_string();

            if value.is_empty() {
                "Unknown".to_string()
            } else {
                value
            }
        }
        Err(_) => "Unknown".to_string(),
    }
}