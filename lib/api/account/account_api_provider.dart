import 'package:dio/dio.dart';
import 'package:ecommerce/api/account/account_response.dart';
import 'package:ecommerce/utils/rest_client.dart';

class AccountApiProvider{
  Future<AccountResponse> getAccount(String userName) async{
    String url = "/account/$userName";
    Dio _dio = RestClient.getDio();
    Response response = await _dio.get(url);
    return AccountResponse.fromJson(response.data);
  }

  // Future createAccount() async{
  //   String url ="/account";
  //   Dio _dio = RestClient.getDio();
  //   Response response = await _dio.post(url,
  //   data: )
  // }
}