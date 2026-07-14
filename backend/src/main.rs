mod adb;
mod device;

use axum::{
    routing::get,
    Json,
    Router,
};
use serde::Serialize;
use std::net::SocketAddr;

#[derive(Serialize)]
struct ApiDevice {
    id: String,
    status: String,
    manufacturer: String,
    model: String,
    version: String,
}

async fn home() -> &'static str {
    "SideDroid Backend is running!"
}

async fn devices() -> Json<Vec<ApiDevice>> {
    let mut list = Vec::new();

    let devices = adb::list_devices();

    for device in devices {
        let info = adb::get_device_info(&device.id);

        list.push(ApiDevice {
            id: device.id,
            status: device.status,
            manufacturer: info.manufacturer,
            model: info.model,
            version: info.version,
        });
    }

    Json(list)
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