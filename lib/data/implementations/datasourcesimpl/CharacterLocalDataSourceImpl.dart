

import 'package:oculus_reparo/base/utilities/Constants.dart';
import 'package:oculus_reparo/data/localdatabase/LocalDatabaseBuilder.dart';
import 'package:oculus_reparo/data/localdatabase/entities/CharacterEntity.dart';
import 'package:oculus_reparo/domain/datasources/CharacterDataSource.dart';
import 'package:oculus_reparo/domain/models/characters/Character.dart';
import 'package:tuple/tuple.dart';

class CharacterLocalDataSourceImpl implements CharacterLocalDataSource{

  final LocalDatabaseBuilder _localDatabaseBuilder;

  CharacterLocalDataSourceImpl(this._localDatabaseBuilder);

  @override
  Future<Tuple3<bool, List<Character>?, String>> getCharacters() async {

    // asking the local database for the character list
    final localDatabase = await _localDatabaseBuilder.getDatabase();
    final characterDao = localDatabase.characterDao;
    final localResult = await characterDao.getAll();
    if(localResult != null){
      if(localResult.isNotEmpty){
        // converting character entities into objects
        final characters = <Character>[];
        for(var characterEntity in localResult){
          characters.add(characterEntity.fromEntityToObj());
        }
        return Tuple3(true, characters, "");
      }
    }
    return const Tuple3(false, null, Constants.THERE_IS_NO_CHARACTERS_IN_LOCAL_DATABASE);
  }

  @override
  saveCharacters(List<Character> characters) async {

    // converting character object into character entity
    final characterEntities = <CharacterEntity>[];
    for (var character in characters) {
      characterEntities.add(CharacterEntity.fromObjToEntity(character));
    }

    // inserting into the local database
    final localDatabase = await _localDatabaseBuilder.getDatabase();
    final characterDao = localDatabase.characterDao;
    await characterDao.insertRows(characterEntities);
  }

  @override
  Future<bool> updateCharacter(Character character) async {
    final localDatabase = await _localDatabaseBuilder.getDatabase();
    final characterDao = localDatabase.characterDao;
    final result = await characterDao.updateCharacter(CharacterEntity.fromObjToEntity(character));
    return result == 1;
  }

}