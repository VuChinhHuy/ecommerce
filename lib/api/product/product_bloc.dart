import 'dart:async';

import 'package:ecommerce/api/product/product_api_provider.dart';
import 'package:ecommerce/api/product/product_response.dart';
import 'package:ecommerce/api/product/product_respository.dart';
import 'package:ecommerce/model/category.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/sql/favorite_responstory.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc{
  final ProductRepository _productRepository = ProductRepository();
  final BehaviorSubject<ProductResponse> _subject =
  BehaviorSubject<ProductResponse>();

  final StreamController<Product> _streamController = StreamController.broadcast();


  getProduct() async{
    ProductResponse product = await _productRepository.getProduct();
    _subject.sink.add(product);
  }
  dispose() {
    _subject.close();

  }

  getProductId(String id) async{
    Product productId = await _productRepository.getProductId(id);
    _streamController.sink.add(productId);

  }
  disposeProduct(){
    _streamController.close();
  }



  BehaviorSubject<ProductResponse> get subject => _subject;

  StreamController<Product> get product => _streamController;


}
final blocProduct = ProductBloc();
