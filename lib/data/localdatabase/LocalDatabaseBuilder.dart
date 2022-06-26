
import 'package:oculus_reparo/base/utilities/Constants.dart';
import 'package:oculus_reparo/data/localdatabase/LocalDatabase.dart';

class LocalDatabaseBuilder {

  static const databaseName = "app_database_${Constants.LOCAL_DATABASE_VERSION}.db";

  Future<LocalDatabase> getDatabase() async {
    final database = await $FloorLocalDatabase
      .databaseBuilder(databaseName)
    .build();
    return database;
  }

}