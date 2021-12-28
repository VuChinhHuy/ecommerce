import 'package:dio/dio.dart';
import 'package:ecommerce/api/review/review_response.dart';
import 'package:ecommerce/utils/rest_client.dart';

class ReviewApiProvider{

  Future<ReviewResponse> getReview(String idProduct) async{
    String url ="/product/$idProduct/reviews";
    Dio _dio = RestClient.getDio();
    Response response =  await _dio.get(url);
    return ReviewResponse.fromJson(response.data);
  }
}