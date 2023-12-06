import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/products_bloc.dart';
import '../../core/model/product_model.dart';

/// Pagination widget who responsible to show data and do pagination calls on scroll
class PaginationWidget<t> extends StatelessWidget {
  final Function() loadMore;
  final Widget initialError;
  final Widget initialLoading;
  final Widget initialEmpty;
  final Widget Function(t p) child;
  final Widget? onLoadMoreError;
  final Widget? onLoadMoreLoading;

  const PaginationWidget({
    super.key,
    required this.loadMore,
    required this.initialError,
    required this.initialLoading,
    required this.initialEmpty,
    this.onLoadMoreError,
    this.onLoadMoreLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductsLoaded) {
          List<ProductModel> products = state.products.products;
          return NotificationListener<ScrollEndNotification>(
              onNotification: (scrollInfo) {
                scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && !state.products.reachMax
                    ? loadMore()
                    : null;
                return true;
              },
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: products.length, itemBuilder: (context, index) => child(products[index] as t))),
                  const SizedBox(
                    height: 20,
                  ),
                  //if error occured while loading more
                  if (state.error != null) Expanded(child: onLoadMoreError ?? initialError),
                  if (state.loading != null) Expanded(child: onLoadMoreLoading ?? initialLoading),
                ],
              ));
        }
        if (state is ProductsInitialLoading) {
          return initialLoading;
        }
        if (state is ProductsEmpty) {
          return initialEmpty;
        }
        if (state is ProductInitialError) {
          return initialError;
        }
        return const SizedBox.shrink();
      },
    );
  }
}
