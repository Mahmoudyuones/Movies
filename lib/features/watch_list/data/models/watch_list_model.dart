class WatchListModel {
  final int id;
  final String title;
  final String releaseDate;
  final String imageUrl;
  final DateTime addedDate;

  WatchListModel({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.imageUrl,
    DateTime? addedDate,
  }) : addedDate = addedDate ?? DateTime.now();

  factory WatchListModel.fromMap(Map<dynamic, dynamic> json) {
    return WatchListModel(
      id: json['id'],
      title: json['title'],
      releaseDate: json['releaseDate'],
      imageUrl: json['imageUrl'],
      addedDate: DateTime.parse(json['addedDate']),
    );
  }

  Map<dynamic, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'releaseDate': releaseDate,
      'imageUrl': imageUrl,
      'addedDate': addedDate.toIso8601String(),
    };
  }
}
