import 'dart:async';

import 'package:ecommerce/model/product.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc_provider.dart';

class CartProductBloc extends BlocBase{

  int count = 1;

  ///
  /// Stream of all the cart
  ///
  final StreamController<List<Product>> _prodcutInCartController = StreamController<List<Product>>();
  Sink<List<Product>> get inCart => _prodcutInCartController.sink;


  ///
  /// Interface that allows to get the total number of favorites
  ///
  final BehaviorSubject<int> _quantityCartController = BehaviorSubject<int>.seeded(0);
  Sink<int> get _inQuantityCart => _quantityCartController.sink;
  Stream<int> get outQuantityCart => _quantityCartController.stream;

  BehaviorSubject<Product> _quantityPlusController = new BehaviorSubject<Product>();
  Sink<Product> get inQuantityPlus => _quantityPlusController.sink;

  ///
  /// Constructor
  ///
  CartProductBloc(Product product){
    //
    // We are listening to all favorites
    //
    _prodcutInCartController.stream
    // but, we only consider the one that matches THIS one
        .map((list) => list.any((Product item) => item.id == product.id))

        .listen((event) {
          _handlePlusCart(product);
    });

  }
  @override
  void dispose() {
    // TODO: implement dispose
  }

  void _handlePlusCart(Product product){

  }
}