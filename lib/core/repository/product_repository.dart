import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:untitled/core/model/product_response.dart';
import 'package:untitled/core/network/api_constant.dart';
import 'package:untitled/core/network/failure_model.dart';

/// Repository class to execute network calls and return data
class ProductRepository {
  Future<Either<FailureModel, ProductResponse>> getProducts({required int page}) async {
    try {
      final url = '${ApiConstant.getProduct}$page';
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        final productData = ProductResponse.fromJson(response.data);
        return Right(productData);
      } else {
        return Left(FailureModel(message: response.data.toString()));
      }
    } catch (error) {
      return Left(FailureModel(message: error.toString()));
    }
  }
}
