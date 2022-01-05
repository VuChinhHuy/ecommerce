// dao/person_dao.dart

import 'package:ecommerce/sql/favorite_enity.dart';
import 'package:floor/floor.dart';

@dao
abstract class FavoriteDao {
  @Query('SELECT * FROM FavoriteSQL')
  Future<List<FavoriteSQL>> findAllFavorite();
  
  @Query('SELECT * FROM FavoriteSQL WHERE id = :id')
  Future<FavoriteSQL?> findFavoriteId(int id);


  @insert
  Future<void> insertFavorite(FavoriteSQL favoriteSQL);


  @delete
  Future<void> deleteFavorite(FavoriteSQL favoriteSQL);
}