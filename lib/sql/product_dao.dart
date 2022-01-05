
import 'package:ecommerce/sql/favorite_enity.dart';
import 'package:ecommerce/sql/product_enity.dart';
import 'package:floor/floor.dart';

@dao
abstract class ProductDao {
  @Query('SELECT * FROM ProductSQL')
  Future<List<ProductSQL>> findAllProduct();


  @Query('SELECT * FROM ProductSQL WHERE id = :id')
  Future<ProductSQL?> findProductId(int id);

  @insert
  Future<void> insertProduct(ProductSQL productSQL);


  @delete
  Future<void> deleteProduct(ProductSQL productSQL);

  @update
  Future<void> updateProduct(ProductSQL productSQL);

}