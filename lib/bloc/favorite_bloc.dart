import 'dart:async';
import 'dart:collection';

import 'package:ecommerce/bloc/bloc_provider.dart';
import 'package:ecommerce/model/product.dart';
import 'package:rxdart/rxdart.dart';


class FavoriteBloc implements BlocBase{

  ///
  /// Unique list of all favorite product
  ///
  final Set<Product> _favorites = Set<Product>();

  // ##########  STREAMS  ##############
  ///
  /// Interface that allows to add a new favorite product
  ///
  BehaviorSubject<Product> _favoriteAddController = new BehaviorSubject<Product>();
  Sink<Product> get inAddFavorite => _favoriteAddController.sink;

  ///
  /// Interface that allows to remove a product from the list of favorites
  ///
  BehaviorSubject<Product> _favoriteRemoveController = new BehaviorSubject<Product>();
  Sink<Product> get inRemoveFavorite => _favoriteRemoveController.sink;

  ///
  /// Interface that allows to get the total number of favorites
  ///
  final BehaviorSubject<int> _favoriteTotalController = BehaviorSubject<int>.seeded(0);
  Sink<int> get _inTotalFavorites => _favoriteTotalController.sink;
  Stream<int> get outTotalFavorites => _favoriteTotalController.stream;

  ///
  /// Interface that allows to get the list of all favorite product
  ///
  BehaviorSubject<List<Product>> _favoritesController = BehaviorSubject<List<Product>>.seeded([]);
  Sink<List<Product>> get _inFavorites =>_favoritesController.sink;
  Stream<List<Product>> get outFavorites =>_favoritesController.stream;

  ///
  /// Constructor
  ///
  FavoriteBloc(){
    _favoriteAddController.listen(_handleAddFavorite);
    _favoriteRemoveController.listen(_handleRemoveFavorite);
  }

  @override
  void dispose(){
    _favoriteAddController.close();
    _favoriteRemoveController.close();
    _favoriteTotalController.close();
    _favoritesController.close();
  }

  // ############# HANDLING  #####################

  void _handleAddFavorite(Product favorite){
    // Add the movie to the list of favorite ones
    _favorites.add(favorite);

    _notify();
  }

  void _handleRemoveFavorite(Product favorite){
    _favorites.remove(favorite);

    _notify();
  }

  void _notify(){
    // Send to whomever is interested...
    // The total number of favorites
    _inTotalFavorites.add(_favorites.length);

    // The new list of all favorite product
    _inFavorites.add(UnmodifiableListView(_favorites));
  }
}