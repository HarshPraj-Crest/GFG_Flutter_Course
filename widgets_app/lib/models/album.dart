class Album {
  const Album({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}
