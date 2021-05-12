class AnalyticModel {
  bool status = false;
  List<AnalyticListModel> data;
  String message;

  AnalyticModel({this.status, this.data, this.message});

  AnalyticModel.fromJson(Map<String, dynamic> json) {
    this.data = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach(
        (res) => {
          data.add(AnalyticListModel.fromJson(res)),
        },
      );
    }
  }
}

class AnalyticListModel {
  String state;
  int count;
  AnalyticListModel({this.state, this.count});

  AnalyticListModel.fromJson(Map<String, dynamic> json) {
    this.state = json['details']['state'];
    this.count = json['count'];
  }
}
