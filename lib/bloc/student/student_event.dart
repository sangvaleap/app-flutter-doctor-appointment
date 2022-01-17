import 'package:meta/meta.dart';

@immutable
abstract class StudentEvent {}

class GetStudent extends StudentEvent {
  final String sessionId;
  final apiToken;
  GetStudent({required this.sessionId, required this.apiToken});
}

class AddStudent extends StudentEvent {
  final String sessionId;
  final String studentName, studentPhoneNumber, studentGender, studentAddress;
  final apiToken;
  AddStudent({required this.sessionId, required this.studentName, required this.studentPhoneNumber, required this.studentGender, required this.studentAddress, required this.apiToken});
}

class EditStudent extends StudentEvent {
  final String sessionId;
  final int studentId, index;
  final String studentName, studentPhoneNumber, studentGender, studentAddress;
  final apiToken;
  EditStudent({required this.sessionId, required this.index, required this.studentId, required this.studentName, required this.studentPhoneNumber, required this.studentGender, required this.studentAddress, required this.apiToken});
}

class DeleteStudent extends StudentEvent {
  final String sessionId;
  final int studentId, index;
  final apiToken;
  DeleteStudent({required this.sessionId, required this.studentId, required this.index, required this.apiToken});
}