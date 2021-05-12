class UserModel {
  String firstName;
  String lastName;
  String email;
  String password;

  UserModel({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    this.firstName = json['first_name'];
    this.lastName = json['last_name'];
    this.email = json['email'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
