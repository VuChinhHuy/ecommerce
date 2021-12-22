import 'package:ecommerce/api/product/product_api_provider.dart';
import 'package:ecommerce/api/product/product_response.dart';
import 'package:ecommerce/model/product.dart';

class ProductRepository{
  ProductApiProvider _productApiProvider = ProductApiProvider();

  Future<ProductResponse> getProduct(){
    return _productApiProvider.getProduct();
  }

}