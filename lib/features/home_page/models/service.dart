class Service {
  final String id;
  final String title;
  final String description;
  final String icon;

  Service({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
  });

  factory Service.fromFirestore(Map<String, dynamic> data, String id) {
    return Service(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      icon: data['icon'] ?? '',
    );
  }
}
