part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  CartEntity cartEntity;
  CartLoaded({required this.cartEntity});

  @override
  List<Object> get props => [cartEntity];
}

class CartError extends CartState {
  final String message;
  const CartError({required this.message});

  @override
  List<Object> get props => [message];
}
