import 'package:mobile_shop/core/services/client.dart';
import 'package:mobile_shop/features/product/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductModel> getProduct();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final RestClient client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<ProductModel> getProduct() async {
    List<ProductModel> result = await client.getProductDetails();
    return result.first;
  }
}
