
import 'package:oculus_reparo/domain/models/characters/Wand.dart';

class Character {

  String? name;
  List<String>? alternateNames;
  String? species;
  String? gender;
  String? house;
  String? dateOfBirth;
  int? yearOfBirth;
  bool? wizard;
  String? ancestry;
  String? eyeColour;
  String? hairColour;
  Wand? wand;
  String? patronus;
  bool? hogwartsStudent;
  bool? hogwartsStaff;
  String? actor;
  List<String>? alternateActors;
  bool? alive;
  String? image;

  Character({
    this.name,
    this.alternateNames,
    this.species,
    this.gender,
    this.house,
    this.dateOfBirth,
    this.yearOfBirth,
    this.wizard,
    this.ancestry,
    this.eyeColour,
    this.hairColour,
    this.wand,
    this.patronus,
    this.hogwartsStudent,
    this.hogwartsStaff,
    this.actor,
    this.alternateActors,
    this.alive,
    this.image
  });

  Character.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    species = json['species'];
    if (json['alternateNames'] != null) {
      alternateNames = <String>[];
      json['alternateNames'].forEach((v) {
        alternateNames!.add(v);
      });
    }
    gender = json['gender'];
    house = json['house'];
    dateOfBirth = json['dateOfBirth'];
    yearOfBirth = json['yearOfBirth'].toString().isNotEmpty ? int.parse(json['yearOfBirth'].toString()) : 0;
    wizard = json['wizard'];
    ancestry = json['ancestry'];
    eyeColour = json['eyeColour'];
    hairColour = json['hairColour'];
    wand = json['wand'] != null ? Wand.fromJson(json['wand']) : null;
    patronus = json['patronus'];
    hogwartsStudent = json['hogwartsStudent'];
    hogwartsStaff = json['hogwartsStaff'];
    actor = json['actor'];
    if (json['alternateActors'] != null) {
      alternateActors = <String>[];
      json['alternateActors'].forEach((v) {
        alternateActors!.add(v);
      });
    }
    alive = json['alive'];
    image = json['image'];
  }

}