import 'package:untitled/core/model/product_model.dart';

/// Model class to hold product response data
class ProductResponse {
  final List<ProductModel> products;
  final bool reachMax;
  final int currentPage;

  const ProductResponse({
    required this.products,
    required this.currentPage,
    required this.reachMax,
  });

  //constructor to parse json data and return ProductResponse Model Instance
  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
        products: (json['products'] as List).map((e) => ProductModel.fromJson(e)).toList(),
        currentPage: json['current_page'],
        reachMax: json['reach_max']);
  }
}
