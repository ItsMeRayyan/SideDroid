mod adb;
mod device;

use axum::{
    routing::get,
    Json, Router,
};
use serde::Serialize;
use std::net::SocketAddr;

#[derive(Serialize)]
struct ApiDevice {
    id: String,
    status: String,
    manufacturer: String,
    model: String,
    system: String,
}

async fn home() -> &'static str {
    "SideDroid Backend is running!"
}

async fn devices() -> Json<Vec<ApiDevice>> {
    let devices = device::get_devices();

    let mut api_devices = Vec::new();

    for d in devices {
        let info = adb::get_device_info(&d.id);

        api_devices.push(ApiDevice {
            id: d.id,
            status: d.status,
            manufacturer: info.manufacturer,
            model: info.model,
            system: info.system,
        });
    }

    Json(api_devices)
}

#[tokio::main]
async fn main() {
    println!("SideDroid Backend");
    println!("================");

    if adb::check_adb() {
        println!("ADB: Found ✓");
    } else {
        println!("ADB: Missing ✗");
    }

    let app = Router::new()
        .route("/", get(home))
        .route("/devices", get(devices));

    let address = SocketAddr::from(([127, 0, 0, 1], 8080));

    println!();
    println!("Server running:");
    println!("http://{}", address);

    let listener = tokio::net::TcpListener::bind(address)
        .await
        .unwrap();

    axum::serve(listener, app)
        .await
        .unwrap();
}