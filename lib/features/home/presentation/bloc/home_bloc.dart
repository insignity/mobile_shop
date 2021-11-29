import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_shop/core/error/failure.dart';
import 'package:mobile_shop/features/home/domain/entities/best_seller_entity.dart';
import 'package:mobile_shop/features/home/domain/entities/home_store_entity.dart';
import 'package:mobile_shop/features/home/domain/usecases/get_best_sellers.dart';
import 'package:mobile_shop/features/home/domain/usecases/get_home_stores.dart';

part 'home_event.dart';
part 'home_state.dart';

const serverFailureMessage = 'Server Failure';
const cacheFailureMessage = 'Cache Failure';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetBestSellers getBestSellers;
  GetHomeStores getHomeStores;

  HomeBloc({required this.getBestSellers, required this.getHomeStores})
      : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeLoad) {
        emit(HomeLoading());

        final failureOrBestSellers = await getBestSellers();
        final failureOrHomeStores = await getHomeStores();

        emit(failureOrBestSellers
            .fold((error) => HomeError(message: _mapFailureToMessage(error)),
                (bestSellers) {
          return failureOrHomeStores
              .fold((error) => HomeError(message: _mapFailureToMessage(error)),
                  (homeStores) {
            return HomeLoaded(bestSellers: bestSellers, homeStores: homeStores);
          });
        }));
      }
    });
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
}
