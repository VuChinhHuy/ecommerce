import 'dart:convert';

import 'package:ecommerce/model/category.dart';

class CategoryResponse{
  final List<Category> list;
  final String error;
  CategoryResponse(this.list,this.error);

  CategoryResponse.fromJson(String json)
      : list = (jsonDecode(json)['hydra:member'] as List).map((e) => Category.fromJson(e)).toList(),
        error ="";
  CategoryResponse.withError(String errorValue)
      : list = [],
        error = errorValue;
}