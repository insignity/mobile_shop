import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_shop/core/error/failure.dart';
import 'package:mobile_shop/features/product/domain/entities/product_entity.dart';
import 'package:mobile_shop/features/product/domain/usecases/get_products.dart';

part 'product_event.dart';
part 'product_state.dart';

const serverFailureMessage = 'Server Failure';
const cacheFailureMessage = 'Cache Failure';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  GetProducts getProducts;
  ProductBloc({required this.getProducts}) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      if (event is ProductLoad) {
        emit(ProductLoading());

        final failureOrProducts = await getProducts();

        emit(failureOrProducts
            .fold((error) => ProductError(message: _mapFailureToMessage(error)),
                (products) {
          return ProductLoaded(products: products);
        }));
      }
    });
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return serverFailureMessage;
    case CacheFailure:
      return cacheFailureMessage;
    default:
      return 'Unexpected Error';
  }
}
