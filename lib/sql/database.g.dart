// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorDataEcommerce {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DataEcommerceBuilder databaseBuilder(String name) =>
      _$DataEcommerceBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DataEcommerceBuilder inMemoryDatabaseBuilder() =>
      _$DataEcommerceBuilder(null);
}

class _$DataEcommerceBuilder {
  _$DataEcommerceBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$DataEcommerceBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$DataEcommerceBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<DataEcommerce> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$DataEcommerce();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$DataEcommerce extends DataEcommerce {
  _$DataEcommerce([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  FavoriteDao? _favoriteDaoInstance;

  ProductDao? _productDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `FavoriteSQL` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ProductSQL` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `quantity` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FavoriteDao get favoriteDao {
    return _favoriteDaoInstance ??= _$FavoriteDao(database, changeListener);
  }

  @override
  ProductDao get productDao {
    return _productDaoInstance ??= _$ProductDao(database, changeListener);
  }
}

class _$FavoriteDao extends FavoriteDao {
  _$FavoriteDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _favoriteSQLInsertionAdapter = InsertionAdapter(
            database,
            'FavoriteSQL',
            (FavoriteSQL item) =>
                <String, Object?>{'id': item.id, 'name': item.name}),
        _favoriteSQLDeletionAdapter = DeletionAdapter(
            database,
            'FavoriteSQL',
            ['id'],
            (FavoriteSQL item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FavoriteSQL> _favoriteSQLInsertionAdapter;

  final DeletionAdapter<FavoriteSQL> _favoriteSQLDeletionAdapter;

  @override
  Future<List<FavoriteSQL>> findAllFavorite() async {
    return _queryAdapter.queryList('SELECT * FROM FavoriteSQL',
        mapper: (Map<String, Object?> row) =>
            FavoriteSQL(row['id'] as int, row['name'] as String));
  }

  @override
  Future<FavoriteSQL?> findFavoriteId(int id) async {
    return _queryAdapter.query('SELECT * FROM FavoriteSQL WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            FavoriteSQL(row['id'] as int, row['name'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertFavorite(FavoriteSQL favoriteSQL) async {
    await _favoriteSQLInsertionAdapter.insert(
        favoriteSQL, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteFavorite(FavoriteSQL favoriteSQL) async {
    await _favoriteSQLDeletionAdapter.delete(favoriteSQL);
  }
}

class _$ProductDao extends ProductDao {
  _$ProductDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _productSQLInsertionAdapter = InsertionAdapter(
            database,
            'ProductSQL',
            (ProductSQL item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'quantity': item.quantity
                }),
        _productSQLUpdateAdapter = UpdateAdapter(
            database,
            'ProductSQL',
            ['id'],
            (ProductSQL item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'quantity': item.quantity
                }),
        _productSQLDeletionAdapter = DeletionAdapter(
            database,
            'ProductSQL',
            ['id'],
            (ProductSQL item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'quantity': item.quantity
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ProductSQL> _productSQLInsertionAdapter;

  final UpdateAdapter<ProductSQL> _productSQLUpdateAdapter;

  final DeletionAdapter<ProductSQL> _productSQLDeletionAdapter;

  @override
  Future<List<ProductSQL>> findAllProduct() async {
    return _queryAdapter.queryList('SELECT * FROM ProductSQL',
        mapper: (Map<String, Object?> row) => ProductSQL(
            row['id'] as int, row['name'] as String, row['quantity'] as int));
  }

  @override
  Future<ProductSQL?> findProductId(int id) async {
    return _queryAdapter.query('SELECT * FROM ProductSQL WHERE id = ?1',
        mapper: (Map<String, Object?> row) => ProductSQL(
            row['id'] as int, row['name'] as String, row['quantity'] as int),
        arguments: [id]);
  }

  @override
  Future<void> insertProduct(ProductSQL productSQL) async {
    await _productSQLInsertionAdapter.insert(
        productSQL, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateProduct(ProductSQL productSQL) async {
    await _productSQLUpdateAdapter.update(productSQL, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteProduct(ProductSQL productSQL) async {
    await _productSQLDeletionAdapter.delete(productSQL);
  }
}
