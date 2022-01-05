
import 'package:ecommerce/model/product.dart';
import 'package:floor/floor.dart';

@entity
class ProductSQL {
  @primaryKey
  final int id;
  final String name;
  final int quantity;



  ProductSQL(this.id, this.name,this.quantity);
}