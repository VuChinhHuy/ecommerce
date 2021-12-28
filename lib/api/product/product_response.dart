
import 'dart:convert';

import 'package:ecommerce/model/product.dart';

class ProductResponse{
  final List<Product> list;
  final String error;
  ProductResponse(this.list,this.error);

  ProductResponse.fromJson(String json)
      : list = (jsonDecode(json)['hydra:member'] as List).map((e) => Product.fromJson(e)).toList(),
  error ="";
  ProductResponse.withError(String errorValue)
      : list = [],
        error = errorValue;
}