import 'package:dio/dio.dart';
import 'package:ecommerce/api/seller/seller_response.dart';
import 'package:ecommerce/utils/rest_client.dart';

class SellerApiProvider{

  Future<SellerResponse> getSeller() async{
    String url ="/sellers";
    Dio _dio = RestClient.getDio();
    Response response =  await _dio.get(url);
    return SellerResponse.fromJson(response.data);
  }
}