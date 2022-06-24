
import 'package:oculus_reparo/domain/models/characters/Character.dart';
import 'package:oculus_reparo/domain/repositories/CharacterRepository.dart';
import 'package:oculus_reparo/domain/usecases/CharacterUseCases.dart';
import 'package:tuple/tuple.dart';

class CharacterUseCasesImpl implements CharacterUseCases {

  final CharacterRepository _characterRepository;

  CharacterUseCasesImpl(this._characterRepository);

  @override
  Future<Tuple3<bool, List<Character>?, String>> getCharacters() async =>
      await _characterRepository.getCharacters();

  @override
  Future<Tuple3<bool, Character?, String>> getCharacter(String name) async =>
      await _characterRepository.getCharacter(name);

}