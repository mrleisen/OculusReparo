
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:oculus_reparo/base/utilities/Constants.dart';
import 'package:oculus_reparo/data/localdatabase/daos/CharacterDao.dart';
import 'package:oculus_reparo/data/localdatabase/entities/CharacterEntity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'LocalDatabase.g.dart';

@Database(
  version: Constants.LOCAL_DATABASE_VERSION,
  entities: [
    CharacterEntity
  ]
)

abstract class LocalDatabase extends FloorDatabase {
  CharacterDao get characterDao;
}