// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LocalDatabase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorLocalDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$LocalDatabaseBuilder databaseBuilder(String name) =>
      _$LocalDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$LocalDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$LocalDatabaseBuilder(null);
}

class _$LocalDatabaseBuilder {
  _$LocalDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$LocalDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$LocalDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<LocalDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$LocalDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$LocalDatabase extends LocalDatabase {
  _$LocalDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CharacterDao? _characterDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
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
            'CREATE TABLE IF NOT EXISTS `CharacterEntity` (`name` TEXT, `image` TEXT, `house` TEXT, `species` TEXT, `gender` TEXT, `dateOfBirth` TEXT, `wizard` INTEGER, `ancestry` TEXT, `hogwartsStudent` INTEGER, `hogwartsStaff` INTEGER, `actor` TEXT, `alive` INTEGER, `imageBase64` TEXT, PRIMARY KEY (`name`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CharacterDao get characterDao {
    return _characterDaoInstance ??= _$CharacterDao(database, changeListener);
  }
}

class _$CharacterDao extends CharacterDao {
  _$CharacterDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _characterEntityInsertionAdapter = InsertionAdapter(
            database,
            'CharacterEntity',
            (CharacterEntity item) => <String, Object?>{
                  'name': item.name,
                  'image': item.image,
                  'house': item.house,
                  'species': item.species,
                  'gender': item.gender,
                  'dateOfBirth': item.dateOfBirth,
                  'wizard': item.wizard,
                  'ancestry': item.ancestry,
                  'hogwartsStudent': item.hogwartsStudent,
                  'hogwartsStaff': item.hogwartsStaff,
                  'actor': item.actor,
                  'alive': item.alive,
                  'imageBase64': item.imageBase64
                }),
        _characterEntityUpdateAdapter = UpdateAdapter(
            database,
            'CharacterEntity',
            ['name'],
            (CharacterEntity item) => <String, Object?>{
                  'name': item.name,
                  'image': item.image,
                  'house': item.house,
                  'species': item.species,
                  'gender': item.gender,
                  'dateOfBirth': item.dateOfBirth,
                  'wizard': item.wizard,
                  'ancestry': item.ancestry,
                  'hogwartsStudent': item.hogwartsStudent,
                  'hogwartsStaff': item.hogwartsStaff,
                  'actor': item.actor,
                  'alive': item.alive,
                  'imageBase64': item.imageBase64
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CharacterEntity> _characterEntityInsertionAdapter;

  final UpdateAdapter<CharacterEntity> _characterEntityUpdateAdapter;

  @override
  Future<List<CharacterEntity>?> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM CharacterEntity',
        mapper: (Map<String, Object?> row) => CharacterEntity(
            row['name'] as String?,
            row['image'] as String?,
            row['house'] as String?,
            row['species'] as String?,
            row['gender'] as String?,
            row['dateOfBirth'] as String?,
            row['wizard'] as int?,
            row['ancestry'] as String?,
            row['hogwartsStudent'] as int?,
            row['hogwartsStaff'] as int?,
            row['actor'] as String?,
            row['alive'] as int?,
            row['imageBase64'] as String?));
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM CharacterEntity');
  }

  @override
  Future<int> insertRow(CharacterEntity characterEntity) {
    return _characterEntityInsertionAdapter.insertAndReturnId(
        characterEntity, OnConflictStrategy.replace);
  }

  @override
  Future<List<int>> insertRows(List<CharacterEntity> characterEntities) {
    return _characterEntityInsertionAdapter.insertListAndReturnIds(
        characterEntities, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateCharacter(CharacterEntity characterEntity) {
    return _characterEntityUpdateAdapter.updateAndReturnChangedRows(
        characterEntity, OnConflictStrategy.abort);
  }
}
