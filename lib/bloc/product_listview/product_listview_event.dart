import 'package:meta/meta.dart';

@immutable
abstract class ProductListviewEvent {}

class GetProductListview extends ProductListviewEvent {
  final String sessionId, skip, limit;
  final apiToken;
  GetProductListview({required this.sessionId, required this.skip, required this.limit, required this.apiToken});
}