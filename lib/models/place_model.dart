class Place {
  final int id;
  final String name;
  final String imageUrl;
  final double rating;
  final String description;

  Place({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.description,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      rating: json['rating'].toDouble(),
      description: json['description'],
    );
  }
}