import 'package:dio/dio.dart';
import 'package:ecommerce/api/category/category_response.dart';
import 'package:ecommerce/utils/rest_client.dart';

class CategoryApiProvider{

  Future<CategoryResponse> getCategroy() async{
    Dio _dio = RestClient.getDio();
    Response response =  await _dio.get('/categories');
    return CategoryResponse.fromJson(response.data);
  }
}