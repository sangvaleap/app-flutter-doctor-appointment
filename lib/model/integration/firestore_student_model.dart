class FirestoreStudentModel {
  late String studentId;
  late String studentName;
  late String studentPhoneNumber;
  late String studentGender;
  late String studentAddress;

  FirestoreStudentModel({required this.studentId, required this.studentName, required this.studentPhoneNumber, required this.studentGender, required this.studentAddress});

  FirestoreStudentModel.fromJson(Map<String, dynamic> json) {
    studentId = json['studentId'];
    studentName = json['studentName'];
    studentPhoneNumber = json['studentPhoneNumber'];
    studentGender = json['studentGender'];
    studentAddress = json['studentAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentId'] = this.studentId;
    data['studentName'] = this.studentName;
    data['studentPhoneNumber'] = this.studentPhoneNumber;
    data['studentGender'] = this.studentGender;
    data['studentAddress'] = this.studentAddress;
    return data;
  }
}