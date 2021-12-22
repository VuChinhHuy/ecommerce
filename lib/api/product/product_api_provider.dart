import 'package:dio/dio.dart';
import 'package:ecommerce/api/product/product_response.dart';
import 'package:ecommerce/model/product.dart';



class ProductApiProvider{
  final String url ="http://khoaluantotnghiep.tk/api/products";
  final Dio _dio = Dio();

  Future<ProductResponse> getProduct() async{
    Response response =  await _dio.get(url);
    return ProductResponse.fromJson(response.data);
  }

}