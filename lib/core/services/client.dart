import 'package:dio/dio.dart' hide Headers;
import 'package:mobile_shop/features/cart/data/models/cart_model.dart';
import 'package:mobile_shop/features/product/data/models/product_model.dart';
import 'package:retrofit/retrofit.dart';
part 'client.g.dart';

@RestApi(baseUrl: "https://db2021ecom-edca.restdb.io/rest")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/main")
  @Headers({
    "accept": "application/json",
    "x-apikey": "2aa8e910f6c4ade81a84c9333ffc7bf6a398e"
  })
  Future<dynamic> getMain();

  @GET("/mycart")
  @Headers({
    "accept": "application/json",
    "x-apikey": "2aa8e910f6c4ade81a84c9333ffc7bf6a398e"
  })
  Future<List<CartModel>> getMyCart();

  @GET("/productdetails")
  @Headers({
    "accept": "application/json",
    "x-apikey": "2aa8e910f6c4ade81a84c9333ffc7bf6a398e"
  })
  Future<List<ProductModel>> getProductDetails();
}
