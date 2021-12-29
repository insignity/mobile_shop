import 'package:mobile_shop/features/product/domain/entities/product_entity.dart';

class ProductLoadingAction {}

class ProductLoadedAction {
  final List<ProductEntity> products;
  const ProductLoadedAction({required this.products});
}

class ProductErrorAction {
  final String message;

  ProductErrorAction({required this.message});
}
