import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce/api/product/product_response.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/utils/rest_client.dart';



class ProductApiProvider{


  Future<ProductResponse> getProduct() async{
    String url ="/products";
    Dio _dio = RestClient.getDio();
    Response response =  await _dio.get(url);
    return ProductResponse.fromJson(response.data);
  }
  Future<Product> getProductId(String id)async{
    String url ="/products/$id";
    Dio _dio = RestClient.getDio();
    Response response =  await _dio.get(url);
    return Product.fromJson(jsonDecode(response.data));
  }

}