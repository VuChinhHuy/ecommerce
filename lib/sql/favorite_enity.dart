// entity/person.dart

import 'package:floor/floor.dart';

@entity
class FavoriteSQL {
  @primaryKey
  final int id;

  final String name;

  FavoriteSQL(this.id, this.name);
}