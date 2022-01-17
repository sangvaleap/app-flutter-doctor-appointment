import 'package:doctor_app/model/integration/product_listview_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductListviewState {}

class InitialProductListviewState extends ProductListviewState {}

class ProductListviewError extends ProductListviewState {
  final String errorMessage;

  ProductListviewError({
    required this.errorMessage,
  });
}

class ProductListviewWaiting extends ProductListviewState {}

class GetProductListviewSuccess extends ProductListviewState {
  final List<ProductListviewModel> productListviewData;
  GetProductListviewSuccess({required this.productListviewData});
}
