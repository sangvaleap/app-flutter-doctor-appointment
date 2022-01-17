import 'package:doctor_app/model/integration/product_grid_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductGridState {}

class InitialProductGridState extends ProductGridState {}

class ProductGridError extends ProductGridState {
  final String errorMessage;

  ProductGridError({
    required this.errorMessage,
  });
}

class ProductGridWaiting extends ProductGridState {}

class GetProductGridSuccess extends ProductGridState {
  final List<ProductGridModel> productGridData;
  GetProductGridSuccess({required this.productGridData});
}
