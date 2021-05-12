class ResponseMessageModel {
  bool status = false;
  String message;
  Map<String, dynamic> data = {};
  Map<String, dynamic> error;

  ResponseMessageModel({this.status, this.message, this.data});

  ResponseMessageModel.fromJson(Map<String, dynamic> json) {
    this.status = json['success'];
    this.message = json['message'];
    this.data = json['data'];
    this.error = json['error'];
  }
}
