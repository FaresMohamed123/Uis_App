class LoginEmployesModel {
  String? employeeName;
  String? employeeNameEn;
  String? token;

  LoginEmployesModel({this.employeeName, this.employeeNameEn, this.token});

  LoginEmployesModel.fromJson(Map<String, dynamic> json) {
    employeeName = json['employeeName'];
    employeeNameEn = json['employeeNameEn'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['employeeName'] = employeeName;
    data['employeeNameEn'] = employeeNameEn;
    data['token'] = token;
    return data;
  }
}