import 'package:dio/dio.dart';
import 'package:ecommerce/api/customer/customer_response.dart';
import 'package:ecommerce/utils/rest_client.dart';

class CustomerApiProvider{

  Future<CustomerResponse> getCustomer(String accountId) async{
    String url = "/account/$accountId/customer";
    Dio _dio = RestClient.getDio();
    Response response =  await _dio.get(url);
    return CustomerResponse.fromJson(response.data);
  }
}