class WatchListModel {
  final int id;
  final String title;
  final String releaseDate;
  final String imageUrl;

  WatchListModel({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.imageUrl,
  });

  factory WatchListModel.fromMap(Map<dynamic, dynamic> map) {
    return WatchListModel(
      id: map['id'],
      title: map['title'],
      releaseDate: map['releaseDate'],
      imageUrl: map['imageUrl'],
    );
  }

  Map<dynamic, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'releaseDate': releaseDate,
      'imageUrl': imageUrl,
    };
  }
}
