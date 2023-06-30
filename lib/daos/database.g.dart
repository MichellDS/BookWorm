// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MyBooksDao? _myBooksDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
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
            'CREATE TABLE IF NOT EXISTS `MyBooks` (`id` TEXT, `title` TEXT, `subtitle` TEXT, `cape` TEXT, `authors` TEXT, `categories` TEXT, `description` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MyBooksDao get myBooksDao {
    return _myBooksDaoInstance ??= _$MyBooksDao(database, changeListener);
  }
}

class _$MyBooksDao extends MyBooksDao {
  _$MyBooksDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _myBooksInsertionAdapter = InsertionAdapter(
            database,
            'MyBooks',
            (MyBooks item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'subtitle': item.subtitle,
                  'cape': item.cape,
                  'authors': item.authors,
                  'categories': item.categories,
                  'description': item.description
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MyBooks> _myBooksInsertionAdapter;

  @override
  Future<List<MyBooks>> findAllBooks() async {
    return _queryAdapter.queryList('SELECT * FROM MyBooks',
        mapper: (Map<String, Object?> row) => MyBooks(
            id: row['id'] as String?,
            title: row['title'] as String?,
            subtitle: row['subtitle'] as String?,
            cape: row['cape'] as String?,
            authors: row['authors'] as String?,
            categories: row['categories'] as String?,
            description: row['description'] as String?));
  }

  @override
  Future<List<String>> findAllBooksTitles() async {
    return _queryAdapter.queryList('SELECT title FROM MyBooks',
        mapper: (Map<String, Object?> row) => row.values.first as String);
  }

  @override
  Future<List<String>> findAllBooksAuthors() async {
    return _queryAdapter.queryList('SELECT authors FROM MyBooks',
        mapper: (Map<String, Object?> row) => row.values.first as String);
  }

  @override
  Future<List<String>> findAllBooksCategories() async {
    return _queryAdapter.queryList('SELECT categories FROM MyBooks',
        mapper: (Map<String, Object?> row) => row.values.first as String);
  }

  @override
  Future<List<String>> findAllBooksDescription() async {
    return _queryAdapter.queryList('SELECT description FROM MyBooks',
        mapper: (Map<String, Object?> row) => row.values.first as String);
  }

  @override
  Future<bool?> findAllBooksbyId(String id) async {
    return _queryAdapter.query('SELECT * FROM MyBooks WHERE id = ?1',
        mapper: (Map<String, Object?> row) => (row.values.first as int) != 0,
        arguments: [id]);
  }

  @override
  Future<void> insertBooks(MyBooks mybooks) async {
    await _myBooksInsertionAdapter.insert(mybooks, OnConflictStrategy.abort);
  }
}
