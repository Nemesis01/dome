class Device {
  // #region Members
  final String macAddress;
  final String name;
  final bool status;
  // #endregion

  Device({
    this.macAddress,
    this.name,
    this.status,
  });

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        macAddress: json['macAddress'],
        name: json['name'],
        status: json['status'],
      );
}
