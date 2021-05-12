class RegistrationInfo {
  final String name;
  final String email;
  final String phone;
  final String businessName;
  final String country;

  RegistrationInfo({
    this.name,
    this.email,
    this.phone,
    this.businessName,
    this.country,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'email': email,
        'phone': phone,
        'business_name': businessName,
        'country': country,
      };
}
