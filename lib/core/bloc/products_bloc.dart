import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/repository/product_repository.dart';

import '../model/product_response.dart';

part 'state/product_state.dart';

part 'event/product_event.dart';

/// Class for BLoC which held state and events
class ProductsBloc extends Bloc<ProductEvent, ProductState> {
  ProductResponse products = const ProductResponse(
    products: [],
    currentPage: 1,
    reachMax: false,
  );

  ProductsBloc() : super(ProductsInitial()) {
    on<ProductEvent>(
      (event, emit) async {
        //Condition to check ProductsLoadEvent event fired
        if (event is ProductsLoadEvent) {
          bool isInitial = products.currentPage == 1;
          isInitial
              ? emit(ProductsInitialLoading(message: 'Fetching products....'))
              : emit(ProductsLoaded(
                  products: products,
                  loading: LoadingMore(message: 'Fetching more products...'),
                ));
          final response = await ProductRepository().getProducts(page: products.currentPage);
          //Handle left side failure case
          response.fold(
            (l) => isInitial
                ? emit(ProductInitialError(message: l.message))
                : emit(ProductsLoaded(
                    products: products,
                    error: LoadMoreError(message: 'Failed to load more products'),
                  )),
            //Handle right side success case
            (r) {
              if (isInitial) {
                products = ProductResponse(
                  products: r.products,
                  currentPage: r.currentPage + 1,
                  reachMax: r.reachMax,
                );

                if (products.products.isEmpty) {
                  emit(ProductsEmpty());
                }
              } else {
                //Adding products to existing list
                products = ProductResponse(
                  products: products.products + r.products,
                  currentPage: r.currentPage + 1,
                  reachMax: r.reachMax,
                );
              }
              emit(ProductsLoaded(products: products));
            },
          );
        }
      },
    );
  }
}
