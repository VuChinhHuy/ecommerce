import 'dart:async';

import 'package:ecommerce/sql/favorite_dao.dart';
import 'package:ecommerce/sql/favorite_enity.dart';
import 'package:ecommerce/sql/product_dao.dart';
import 'package:ecommerce/sql/product_enity.dart';

import 'database.dart';

class DataResponse{
   List<FavoriteSQL> listFavorite = List.empty();
   List<ProductSQL> listProduct = List.empty();
   static FavoriteDao? favoriteDao;
   static ProductDao? productDao;


   Future<void> initDatabase() async{
     final database = await $FloorDataEcommerce.databaseBuilder('ecommerce_database.db').build();
     favoriteDao = database.favoriteDao;
     productDao = database.productDao;
   }

   Future<bool> checkFavorite(FavoriteSQL? favorite) async{
     FavoriteSQL? favoriteSQL = await favoriteDao?.findFavoriteId(favorite!.id);
     if(favoriteSQL != null){
       return Future.value(true);
     }
     else {
       return Future.value(false);
     }
   }

   Future<bool> checkProduct(ProductSQL? product) async{
     ProductSQL? productSQL = await productDao?.findProductId(product!.id);
     if(productSQL != null){
       return Future.value(true);
     }
     else{
       return Future.value(false);
     }

   }
   Future<void> addFavorite(FavoriteSQL? favorite) async{
     favoriteDao?.insertFavorite(favorite!);
   }
   Future<void> removeFavorite(FavoriteSQL? favorite) async{
     favoriteDao?.deleteFavorite(favorite!);
   }

   Future<void> addProduct(ProductSQL? product) async{
     productDao?.insertProduct(product!);
   }

   Future<void> removeProduct(ProductSQL? product) async{
     productDao?.deleteProduct(product!);
   }
}
