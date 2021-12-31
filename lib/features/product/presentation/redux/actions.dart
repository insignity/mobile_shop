import 'package:mobile_shop/features/product/domain/entities/product_entity.dart';

class ProductLoadingAction {}

class ProductLoadedAction {
  final ProductEntity product;
  const ProductLoadedAction({required this.product});
}

class ProductErrorAction {
  final String message;

  ProductErrorAction({required this.message});
}
