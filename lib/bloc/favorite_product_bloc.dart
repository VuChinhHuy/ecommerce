import 'dart:async';

import 'package:ecommerce/bloc/bloc_provider.dart';
import 'package:ecommerce/model/product.dart';
import 'package:rxdart/rxdart.dart';

class FavoriteProductBloc extends BlocBase{
  ///
  /// A stream only meant to return whether THIS product is part of the favorites
  ///
  final BehaviorSubject<bool> _isFavoriteController = BehaviorSubject<bool>();
  Stream<bool> get outIsFavorite => _isFavoriteController.stream;

  ///
  /// Stream of all the favorites
  ///
  final StreamController<List<Product>> _favoritesController = StreamController<List<Product>>();
  Sink<List<Product>> get inFavorites => _favoritesController.sink;

  ///
  /// Constructor
  ///
  FavoriteProductBloc(Product product){
    //
    // We are listening to all favorites
    //
    _favoritesController.stream
    // but, we only consider the one that matches THIS one
        .map((list) => list.any((Product item) => item.id == product.id))
    // if any, we notify that it is part of the Favorites
        .listen((isFavorite) => _isFavoriteController.add(isFavorite));
  }

  void dispose(){
    _favoritesController.close();
    _isFavoriteController.close();
  }
}