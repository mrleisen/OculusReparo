
import 'package:oculus_reparo/domain/datasources/CharacterDataSource.dart';
import 'package:oculus_reparo/domain/models/characters/Character.dart';
import 'package:oculus_reparo/domain/repositories/CharacterRepository.dart';
import 'package:tuple/tuple.dart';

class CharacterRepositoryImpl implements CharacterRepository{

  // this is the data source, if other datasources are needed then it should be added here
  late CharacterLocalDataSource _characterLocalDataSource;
  late CharacterApiDataSource _characterApiDataSource;

  CharacterRepositoryImpl(
      CharacterLocalDataSource characterLocalDataSource,
      CharacterApiDataSource characterApiDataSource
  ){
    _characterLocalDataSource = characterLocalDataSource;
    _characterApiDataSource = characterApiDataSource;
  }

  @override
  Future<Tuple3<bool, List<Character>?, String>> getCharacters() async {

    // asking for the list of character to the local database
    final localResultTuple = await _characterLocalDataSource.getCharacters();
    if(localResultTuple.item1){
      return Tuple3(true, localResultTuple.item2!, "");
    }else{
      // there is no characters saved locally, then get it from the api data source
      final apiResultTuple = await _characterApiDataSource.getCharacters();
      if(apiResultTuple.item1){
        // save characters from api into the local database
        await _characterLocalDataSource.saveCharacters(apiResultTuple.item2!);
        // and return the list
        return Tuple3(true, apiResultTuple.item2!, "");
      }else{
        return Tuple3(false, null, apiResultTuple.item3);
      }
    }
  }

  @override
  Future<bool> updateCharacter(Character character) async =>
      await _characterLocalDataSource.updateCharacter(character);

}