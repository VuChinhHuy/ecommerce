import 'dart:collection';

import 'package:ecommerce/bloc/bloc_provider.dart';
import 'package:ecommerce/model/product.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc implements BlocBase{

  ///
  /// Unique list of all product in cart
  ///
  final Set<Product> _carts = Set<Product>();


  // ##########  STREAMS  ##############
  ///
  /// Interface that allows to add a new product cart
  ///
  BehaviorSubject<Product> _cartAddController = new BehaviorSubject<Product>();
  Sink<Product> get inAddCart => _cartAddController.sink;

  ///
  /// Interface that allows to remove a product from the list of carts
  ///
  BehaviorSubject<Product> _cartRemoveController = new BehaviorSubject<Product>();
  Sink<Product> get inRemoveCart => _cartRemoveController.sink;


  ///
  /// Interface that allows to get the total number of carts
  ///
  final BehaviorSubject<int> _cartsTotalController = BehaviorSubject<int>.seeded(0);
  Sink<int> get _inTotalCart => _cartsTotalController.sink;
  Stream<int> get outTotalCart => _cartsTotalController.stream;

  ///
  /// Interface that allows to get the list of all product in cart
  ///
  BehaviorSubject<List<Product>> _cartsController = BehaviorSubject<List<Product>>.seeded([]);
  Sink<List<Product>> get _inCart =>_cartsController.sink;
  Stream<List<Product>> get outCart =>_cartsController.stream;


  BehaviorSubject<Product> _cartPlusController = new BehaviorSubject<Product>();
  Sink<Product> get inPlusCart => _cartPlusController.sink;

  BehaviorSubject<Product> _cartMinusController = new BehaviorSubject<Product>();
  Sink<Product> get inMinusCart => _cartMinusController.sink;

  ///
  /// Constructor
  ///
  CartBloc(){
    _cartAddController.listen(_handleAddFavorite);
    _cartRemoveController.listen(_handleRemoveFavorite);
  }



  @override
  void dispose() {
    // TODO: implement dispose
    _cartAddController.close();
    _cartRemoveController.close();
    _cartsController.close();
    _cartsTotalController.close();

  }
  // ############# HANDLING  #####################

  void _handleAddFavorite(Product cart){
    // Add the movie to the list of favorite ones
    _carts.add(cart);

    _notify();
  }

  void _handleRemoveFavorite(Product cart){
    _carts.remove(cart);

    _notify();
  }

  void _notify(){
    // Send to whomever is interested...
    // The total number of favorites
    _inTotalCart.add(_carts.length);

    // The new list of all favorite product
    _inCart.add(UnmodifiableListView(_carts));
  }



}