import 'package:ecommerce/api/seller/seller_api_provider.dart';
import 'package:ecommerce/api/seller/seller_response.dart';

class SellerRepository{
  SellerApiProvider _sellerApiProvider = SellerApiProvider();
  Future<SellerResponse> getSeller(){
    return _sellerApiProvider.getSeller();
  }
}