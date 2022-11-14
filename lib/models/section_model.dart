class AzkarsectionModel {
  int? id;
  String? name;
  AzkarsectionModel(this.id, this.name);

  AzkarsectionModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }
}
