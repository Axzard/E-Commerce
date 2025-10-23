class Address {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String city;
  final String zipCode;
  final String country;
  final bool isDefault;

  Address({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.city,
    required this.zipCode,
    required this.country,
    this.isDefault = false,
  });
}
