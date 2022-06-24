
import 'package:oculus_reparo/domain/datasources/CharacterDataSource.dart';
import 'package:oculus_reparo/domain/models/characters/Character.dart';
import 'package:oculus_reparo/domain/repositories/CharacterRepository.dart';
import 'package:tuple/tuple.dart';

class CharacterRepositoryImpl implements CharacterRepository{

  // this is the data source, if other datasources are needed then it should be added here
  late CharacterApiDataSource _characterApiDataSource;

  CharacterRepositoryImpl(
      CharacterApiDataSource characterApiDataSource
  ){
    _characterApiDataSource = characterApiDataSource;
  }

  @override
  Future<Tuple3<bool, List<Character>?, String>> getCharacters() async {

    final resultTuple = await _characterApiDataSource.getCharacters();
    if(resultTuple.item1){
      return Tuple3(true, resultTuple.item2!, "");
    }else{
      return Tuple3(false, null, resultTuple.item3);
    }
  }

  @override
  Future<Tuple3<bool, Character?, String>> getCharacter(String name) {
    // TODO: implement getCharacter
    throw UnimplementedError();
  }

}