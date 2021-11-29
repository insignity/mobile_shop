import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobile_shop/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:mobile_shop/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:mobile_shop/features/cart/domain/repositories/cart_repository.dart';
import 'package:mobile_shop/features/cart/domain/usecases/get_cart.dart';
import 'package:mobile_shop/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:mobile_shop/features/home/data/datasources/home_remote_data_source.dart';
import 'package:mobile_shop/features/home/data/repositories/best_seller_repository_impl.dart';
import 'package:mobile_shop/features/home/domain/repositories/best_seller_repository.dart';
import 'package:mobile_shop/features/home/domain/usecases/get_best_sellers.dart';
import 'package:mobile_shop/features/home/domain/usecases/get_home_stores.dart';
import 'package:mobile_shop/features/home/presentation/bloc/home_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_shop/features/product/data/datasources/product_data_source.dart';
import 'package:mobile_shop/features/product/data/repositories/best_seller_repository_impl.dart';
import 'package:mobile_shop/features/product/domain/repositories/product_repository.dart';
import 'package:mobile_shop/features/product/domain/usecases/get_products.dart';
import 'package:mobile_shop/features/product/presentation/bloc/product_bloc.dart';

final sl = GetIt.instance;

Future init() async {
  //BloC
  sl.registerFactory(() => HomeBloc(getBestSellers: sl(), getHomeStores: sl()));
  sl.registerFactory(() => ProductBloc(getProducts: sl()));
  sl.registerFactory(() => CartBloc(sl()));

  //UseCases
  sl.registerLazySingleton(() => GetBestSellers(sl()));
  sl.registerLazySingleton(() => GetHomeStores(sl()));
  sl.registerLazySingleton(() => GetProducts(sl()));
  sl.registerLazySingleton(() => GetCart(sl()));

  //Repository
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(cartRemoteDataSource: sl()));
  sl.registerLazySingleton<CartRemoteDataSource>(
      () => CartRemoteDataSourceImpl(client: sl()));

  //External
  sl.registerLazySingleton(() => http.Client());

  log('sl has been initialized');
}