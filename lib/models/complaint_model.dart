class ComplaintModel {
  String id;
  String date;
  String town;
  String city;
  String state;
  String fullName;
  String gender;
  String ageApprox;
  double height;
  String eyeColor;
  String skinColor;
  String ethnicity;
  String hairColor;
  bool tattoo;
  String tattooDescription = "";
  bool facialHair;
  String description = "";
  bool status = false;
  String message;
  List<ComplaintListModel> complaintListModel;

  ComplaintModel({
    this.id,
    this.date,
    this.town,
    this.city,
    this.state,
    this.fullName,
    this.gender,
    this.ageApprox,
    this.height,
    this.eyeColor,
    this.skinColor,
    this.ethnicity,
    this.hairColor,
    this.tattoo,
    this.tattooDescription,
    this.facialHair,
    this.description,
    this.status,
    this.message,
  });

  ComplaintModel.fromJson(Map<String, dynamic> json) {
    this.status = json['success'];
    this.message = json['message'];
    if (json['data'] != null) {
      complaintListModel = [];
      json['data'].forEach((v) {
        complaintListModel.add(ComplaintListModel.fromJson(v));
      });
    }
  }

  ComplaintModel.convert(Map<String, dynamic> json) {
    this.status = json['success'];
    this.message = json['message'];
    this.id = json['data']['_id'];
    this.date = json['data']['details']['date'];
    this.fullName = json['data']['details']['abuser_details']['name'];
    this.gender = json['data']['details']['abuser_details']['gender'];
    this.ageApprox = json['data']['details']['abuser_details']['age_approx'];
    this.eyeColor = json['data']['details']['abuser_details']['eye_colour'];
    this.ethnicity = json['data']['details']['abuser_details']['ethnicity'];
    this.hairColor = json['data']['details']['abuser_details']['hair_colour'];
    this.facialHair = json['data']['details']['abuser_details']['facial_hair'];
    this.height = double.parse(
        json['data']['details']['abuser_details']['height'].toString());
    this.description = json['data']['details']['abuser_details']['description'];
    this.town = json['data']['details']['location']['neighbourhood'];
    this.city = json['data']['details']['location']['locality_or_city'];
    this.state = json['data']['details']['location']['state'];
    this.tattoo =
        json['data']['details']['abuser_details']['tattoos']['has_tattoo'];
    this.tattooDescription = json['data']['details']['abuser_details']
        ['tattoos']['tattoo_description'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['location'] = {
      "neighbourhood": this.town.toLowerCase(),
      "locality_or_city": this.city.toLowerCase(),
      "state": this.state.toLowerCase()
    };
    data['date'] = this.date;
    data['abuser_details'] = {
      "name": this.fullName,
      "gender": this.gender.toLowerCase(),
      "age_approx": this.ageApprox,
      "height": this.height,
      "eye_colour": this.eyeColor.toLowerCase(),
      //"skin_colour": this.skinColor.toLowerCase(),
      "ethnicity": this.ethnicity.toLowerCase(),
      "hair_colour": this.hairColor.toLowerCase(),
      "tattoo": this.tattoo,
      "tattoo_description": this.tattooDescription,
      "facial_hair": this.facialHair,
      "description": this.description,
    };
    return data;
  }
}

class ComplaintListModel {
  String id;
  String date;
  String town;
  String city;
  String state;
  String fullName;
  String gender;
  String ageApprox;
  double height;
  String eyeColor;
  String skinColor;
  String ethnicity;
  String hairColor;
  bool tattoo;
  String tattooDescription;
  bool facialHair;
  String description;

  ComplaintListModel({
    this.id,
    this.date,
    this.town,
    this.city,
    this.state,
    this.fullName,
    this.gender,
    this.ageApprox,
    this.height,
    this.eyeColor,
    this.skinColor,
    this.ethnicity,
    this.hairColor,
    this.tattoo,
    this.tattooDescription,
    this.facialHair,
    this.description,
  });

  factory ComplaintListModel.fromJson(Map<String, dynamic> json) {
    return ComplaintListModel(
      id: json['_id'].toString(),
      date: json['details']['date'],
      town: json['details']['location']['neighbourhood'],
      city: json['details']['location']['city'],
      state: json['details']['location']['state'],
      fullName: json['complainant']['name'],
      // height: json['details']['abuser_details']['height'],
      // eyeColor: json['details']['abuser_details']['eye_colour'],
      // ethnicity: json['details']['abuser_details']['ethnicity'],
      // hairColor: json['details']['abuser_details']['hair_colour'],
      // facialHair: json['details']['abuser_details']['facial_hair'],
      // tattoo: json['details']['abuser_details']['tattoos']['has_tattoo'],
      // tattooDescription: json['details']['abuser_details']['tattoos']
      //     ['tattoo_description'],
      // description: json['details']['abuser_details']['description'],
    );
  }
}
