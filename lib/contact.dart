class Contact {
  final String name;
  final String phoneNumber;
  final String email;
  final String? imagePath;

  Contact({
    required this.name,
    required this.phoneNumber,
    required this.email,
    this.imagePath,
  });
}
