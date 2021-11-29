part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<BestSellerEntity> bestSellers;
  final List<HomeStoreEntity> homeStores;
  const HomeLoaded({required this.bestSellers, required this.homeStores});

  @override
  List<Object> get props => [bestSellers, homeStores];
}

class HomeError extends HomeState {
  final String message;
  const HomeError({required this.message});

  @override
  List<Object> get props => [message];
}
