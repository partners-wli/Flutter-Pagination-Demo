import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/ui/widget/empty_widget.dart';
import 'package:untitled/ui/widget/error_widget.dart';
import 'package:untitled/ui/widget/loading_widget.dart';
import 'package:untitled/ui/widget/pagination_widget.dart';
import 'package:untitled/ui/widget/product_card.dart';

import '../core/bloc/products_bloc.dart';
import '../core/model/product_model.dart';

/// UI screen to display product data or errors to user
class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductsBloc>(context).add(ProductsLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pagination Demo",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: PaginationWidget<ProductModel>(
        loadMore: () {
          BlocProvider.of<ProductsBloc>(context).add(ProductsLoadEvent());
        },
        initialEmpty: const EmptyWidget(),
        initialLoading: const LoadingWidget(),
        initialError: const CustomErrorWidget(),
        child: (ProductModel productModel) {
          return ProductCard(product: productModel);
        },
      ),
    );
  }
}
