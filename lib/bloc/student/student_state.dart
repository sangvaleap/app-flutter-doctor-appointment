import 'package:doctor_app/model/integration/student_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class StudentState {}

class InitialStudentState extends StudentState {}

// get student state
class GetStudentWaiting extends StudentState {}

class GetStudentError extends StudentState {
  final String errorMessage;
  GetStudentError({
    required this.errorMessage,
  });
}

class GetStudentSuccess extends StudentState {
  final List<StudentModel> studentData;
  GetStudentSuccess({required this.studentData});
}

// general
class StudentErrorValidation extends StudentState {
  final String errorMessage;
  StudentErrorValidation({
    required this.errorMessage,
  });
}

// add student state
class AddStudentWaiting extends StudentState {}

class AddStudentError extends StudentState {
  final String errorMessage;
  AddStudentError({
    required this.errorMessage,
  });
}

class AddStudentSuccess extends StudentState {
  final int studentId;
  final String msg,
      studentName,
      studentPhoneNumber,
      studentGender,
      studentAddress;
  AddStudentSuccess(
      {required this.msg,
      required this.studentId,
      required this.studentName,
      required this.studentPhoneNumber,
      required this.studentGender,
      required this.studentAddress});
}

// edit student state
class EditStudentWaiting extends StudentState {}

class EditStudentError extends StudentState {
  final String errorMessage;
  EditStudentError({
    required this.errorMessage,
  });
}

class EditStudentSuccess extends StudentState {
  final int studentId, index;
  final String msg,
      studentName,
      studentPhoneNumber,
      studentGender,
      studentAddress;
  EditStudentSuccess(
      {required this.msg,
      required this.index,
      required this.studentId,
      required this.studentName,
      required this.studentPhoneNumber,
      required this.studentGender,
      required this.studentAddress});
}

// delete student state
class DeleteStudentWaiting extends StudentState {}

class DeleteStudentError extends StudentState {
  final String errorMessage;
  DeleteStudentError({
    required this.errorMessage,
  });
}

class DeleteStudentSuccess extends StudentState {
  final String msg;
  final int index;
  DeleteStudentSuccess({required this.msg, required this.index});
}
