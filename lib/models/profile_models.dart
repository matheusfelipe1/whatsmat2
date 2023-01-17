class ProfileModel {
  String? id;
  String? name;

  ProfileModel({this.id, this.name});

  ProfileModel.fromJson(dynamic data)
      : id = data['id'],
        name = data['name'];
}
