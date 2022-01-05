// database.dart

// required package imports
import 'dart:async';
import 'package:ecommerce/sql/favorite_dao.dart';
import 'package:ecommerce/sql/favorite_enity.dart';
import 'package:ecommerce/sql/product_dao.dart';
import 'package:ecommerce/sql/product_enity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;



part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [FavoriteSQL, ProductSQL])
abstract class DataEcommerce extends FloorDatabase {
  FavoriteDao get favoriteDao;
  ProductDao get productDao;
}