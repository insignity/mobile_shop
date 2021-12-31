import 'package:mobile_shop/common/strings.dart';
import 'package:mobile_shop/core/error/failure.dart';
import 'package:mobile_shop/features/product/domain/usecases/get_products.dart';
import 'package:mobile_shop/features/product/presentation/redux/actions.dart';
import 'package:mobile_shop/locator_service.dart';
import 'package:redux/redux.dart';

import 'app_state.dart';

class ProductMiddleware extends MiddlewareClass<AppState> {
  @override
  call(Store<AppState> store, dynamic action, NextDispatcher next) async {
    if (action is ProductLoadingAction) {
      final result = await sl.get<GetProducts>().call();

      await result.fold(
          (error) => store.dispatch(
              ProductErrorAction(message: _mapFailureToMessage(error))),
          (products) => store.dispatch(ProductLoadedAction(product: products)));
    } else {
      next(action);
    }
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
