import 'dart:convert';

import 'package:ecommerce/model/seller.dart';

class SellerResponse{
  final List<Seller> list;
  final String error;

  SellerResponse(this.list,this.error);

  SellerResponse.fromJson(String json) :
        list = (jsonDecode(json)['hydra:member'] as List).map((e) => Seller.fromJson(e)).toList(),
  error ="";

  SellerResponse.withError(String errorValue)
      : list = [],
        error = errorValue;

}