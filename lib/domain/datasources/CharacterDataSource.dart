
import 'package:oculus_reparo/domain/models/characters/Character.dart';
import 'package:tuple/tuple.dart';

abstract class CharacterApiDataSource {
  Future<Tuple3<bool, List<Character>?, String>> getCharacters();
}

abstract class CharacterLocalDataSource {
  Future<Tuple3<bool, List<Character>?, String>> getCharacters();
  Future<Tuple3<bool, Character?, String>> getCharacter(String name);
}