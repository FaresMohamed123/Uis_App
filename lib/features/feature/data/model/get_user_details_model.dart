class GetUserDetailsModel {
  String? employeeName;
  String? employeeNameEn;
  int? employeeId;
  String? department;
  String? companyName;
  bool? isRegistered;

  GetUserDetailsModel(
      {this.employeeName,
      this.employeeNameEn,
      this.employeeId,
      this.department,
      this.companyName,
      this.isRegistered});

  GetUserDetailsModel.fromJson(Map<String, dynamic> json) {
    employeeName = json['employeeName'];
    employeeNameEn = json['employeeNameEn'];
    employeeId = json['employeeId'];
    department = json['department'];
    companyName = json['companyName'];
    isRegistered = json['isRegistered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['employeeName'] = employeeName;
    data['employeeNameEn'] = employeeNameEn;
    data['employeeId'] = employeeId;
    data['department'] = department;
    data['companyName'] = companyName;
    data['isRegistered'] = isRegistered;
    return data;
  }
}