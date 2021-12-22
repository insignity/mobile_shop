import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_shop/common/strings.dart';
import 'package:mobile_shop/core/error/failure.dart';
import 'package:mobile_shop/features/cart/domain/entities/cart_entity.dart';
import 'package:mobile_shop/features/cart/domain/usecases/get_cart.dart';
import 'package:mobile_shop/features/product/presentation/bloc/product_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  GetCart getCart;
  CartBloc(this.getCart) : super(CartInitial()) {
    on<CartEvent>((event, emit) async {
      if (event is CartLoad) {
        emit(CartLoading());

        final failureOrProducts = await getCart();

        emit(failureOrProducts.fold(
            (error) => CartError(message: _mapFailureToMessage(error)),
            (cart) => CartLoaded(cartEntity: cart)));
      }
    });
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return Strings.serverFailureMessage;
    case CacheFailure:
      return Strings.cacheFailureMessage;
    default:
      return Strings.unexpectedErrorMessage;
  }
}
