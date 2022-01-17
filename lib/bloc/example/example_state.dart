import 'package:meta/meta.dart';

@immutable
abstract class ExampleState {}

class InitialExampleState extends ExampleState {}

class ExampleError extends ExampleState {
  final String errorMessage;

  ExampleError({
    required this.errorMessage,
  });
}

class ExampleWaiting extends ExampleState {}

class GetExampleSuccess extends ExampleState {
  final String exampleData;
  GetExampleSuccess({required this.exampleData});
}

class PostExampleSuccess extends ExampleState {
  final String exampleData;
  PostExampleSuccess({required this.exampleData});
}