class Device {

  final String id;
  final String status;
  final String manufacturer;
  final String model;
  final String version;


  Device({
    required this.id,
    required this.status,
    required this.manufacturer,
    required this.model,
    required this.version,
  });


  factory Device.fromJson(Map<String, dynamic> json) {

    return Device(

      id: json["id"] ?? "",
      status: json["status"] ?? "",
      manufacturer: json["manufacturer"] ?? "",
      model: json["model"] ?? "",
      version: json["version"] ?? "",

    );

  }
}