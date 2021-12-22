
import 'package:ecommerce/model/product.dart';

class ProductResponse{
  final List<Product> list;
  final String error;
  ProductResponse(this.list,this.error);

  ProductResponse.fromJson(Map<String, dynamic> json)
      : list = (json as List).map((e) => Product.fromJson(e)).toList(),
  error ="";
  ProductResponse.withError(String errorValue)
      : list = [],
        error = errorValue;
}