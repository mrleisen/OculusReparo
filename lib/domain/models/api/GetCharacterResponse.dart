
import 'package:oculus_reparo/domain/models/characters/Character.dart';

class GetCharacterResponse {

  List<Character>? characters;

  GetCharacterResponse({
    this.characters
  });

  GetCharacterResponse.fromJson(List<dynamic> json) {
    characters = <Character>[];
    for (var character in json) {
      characters!.add(Character.fromJson(character));
    }
  }

}
