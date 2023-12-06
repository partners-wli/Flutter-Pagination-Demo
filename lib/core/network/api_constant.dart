/// Constant class to handle base url and endpoints
class ApiConstant {
  ApiConstant._();

  static const _baseUrl = 'https://flutter-pagination-api-djsmk123.vercel.app/api';

  static const getProduct = '$_baseUrl/get-products?page=';
}
