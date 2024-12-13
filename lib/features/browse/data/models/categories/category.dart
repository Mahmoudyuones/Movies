class Categorey {
  int? id;
  String? name;

  Categorey({this.id, this.name});

  Categorey.fromJson(Map<String, dynamic> json) {
    id = json['id'] ;
    name = json['name'];
  }
}
