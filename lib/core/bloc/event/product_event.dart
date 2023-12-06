part of '../products_bloc.dart';

/// Class for Product events
@immutable
abstract class ProductEvent {}

class ProductsLoadEvent extends ProductEvent {}