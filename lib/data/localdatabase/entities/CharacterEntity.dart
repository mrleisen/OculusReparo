
import 'package:floor/floor.dart';
import 'package:oculus_reparo/base/utilities/Constants.dart';
import 'package:oculus_reparo/domain/models/characters/Character.dart';

@entity
class CharacterEntity {

  @PrimaryKey(autoGenerate: true)
  int? id;
  String? name;
  String? image;
  String? house;
  String? species;
  String? gender;
  String? dateOfBirth;
  int? wizard;
  String? ancestry;
  int? hogwartsStudent;
  int? hogwartsStaff;
  String? actor;
  int? alive;

  CharacterEntity(
    this.name,
    this.image,
    this.house,
    this.species,
    this.gender,
    this.dateOfBirth,
    this.wizard,
    this.ancestry,
    this.hogwartsStudent,
    this.hogwartsStaff,
    this.actor,
    this.alive,
  );

  static CharacterEntity fromObjToEntity(Character character) =>
      CharacterEntity(
          character.name ?? "",
          character.image ?? "",
          character.house ?? "",
          character.species ?? "",
          character.gender ?? "",
          character.dateOfBirth ?? "",
          _getIntForBooleanValue(character.wizard),
          character.ancestry ?? "",
          _getIntForBooleanValue(character.hogwartsStudent),
          _getIntForBooleanValue(character.hogwartsStaff),
          character.actor ?? "",
          _getIntForBooleanValue(character.alive)
      );

  static int _getIntForBooleanValue(bool? value) {
    if(value != null){
      return (value) ? Constants.ENTITY_BOOLEAN_VALUE_FOR_TRUE : Constants.ENTITY_BOOLEAN_VALUE_FOR_FALSE;
    }
    return Constants.ENTITY_BOOLEAN_VALUE_FOR_FALSE;
  }

  Character fromEntityToObj() =>
      Character(
          name: name,
          species: species,
          gender: gender,
          house: house,
          dateOfBirth: dateOfBirth,
          wizard: wizard == Constants.ENTITY_BOOLEAN_VALUE_FOR_TRUE,
          ancestry: ancestry,
          hogwartsStudent: hogwartsStudent == Constants.ENTITY_BOOLEAN_VALUE_FOR_TRUE,
          hogwartsStaff: hogwartsStaff == Constants.ENTITY_BOOLEAN_VALUE_FOR_TRUE,
          actor: actor,
          alive: alive == Constants.ENTITY_BOOLEAN_VALUE_FOR_TRUE,
          image: image
      );

}