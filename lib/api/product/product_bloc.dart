import 'package:ecommerce/api/product/product_api_provider.dart';
import 'package:ecommerce/api/product/product_response.dart';
import 'package:ecommerce/api/product/product_respository.dart';
import 'package:ecommerce/model/category.dart';
import 'package:ecommerce/model/product.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc{
  final ProductRepository _productRepository = ProductRepository();
  final BehaviorSubject<ProductResponse> _subject =
  BehaviorSubject<ProductResponse>();

  getProduct() async{
    ProductResponse product = await _productRepository.getProduct();
    _subject.sink.add(product);
  }
  dispose() {
    _subject.close();
  }

  BehaviorSubject<ProductResponse> get subject => _subject;

}
final blocProduct = ProductBloc();
