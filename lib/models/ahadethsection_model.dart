class AhadethsectionModel {
  int? id;
  String? name;
  AhadethsectionModel(this.id, this.name);

  AhadethsectionModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }
}
