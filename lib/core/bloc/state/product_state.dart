part of '../products_bloc.dart';

/// Class for Product State
@immutable
abstract class ProductState {}

//Initial State
class ProductsInitial extends ProductState {}

//State for initial Loading when current page will be 1
class ProductsInitialLoading extends ProductState {
  final String message;
  ProductsInitialLoading({required this.message});
}

//State for api call failed when current page will be 1
class ProductInitialError extends ProductState {
  final String message;
  ProductInitialError({required this.message});
}

//State for empty products
class ProductsEmpty extends ProductState {}

//State for loaded data
class ProductsLoaded extends ProductState {
  final ProductResponse products;
  final LoadingMore? loading;
  final LoadMoreError? error;
  ProductsLoaded({
    required this.products,
    this.loading,
    this.error,
  });
}

// LoadingMore Model
class LoadingMore {
  final String message;
  LoadingMore({required this.message});
}
// LoadingMoreError Model
class LoadMoreError {
  final String message;
  LoadMoreError({required this.message});
}