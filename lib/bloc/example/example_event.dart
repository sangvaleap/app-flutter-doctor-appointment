import 'package:meta/meta.dart';

@immutable
abstract class ExampleEvent {}

class GetExample extends ExampleEvent {
  final apiToken;
  GetExample({@required this.apiToken});
}

class PostExample extends ExampleEvent {
  final String id;
  final apiToken;
  PostExample({required this.id, required this.apiToken});
}