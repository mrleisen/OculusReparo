
import 'package:oculus_reparo/domain/models/characters/Wand.dart';

class Character {

  String? name;
  String? species;
  String? gender;
  String? house;
  String? dateOfBirth;
  bool? wizard;
  String? ancestry;
  Wand? wand;
  bool? hogwartsStudent;
  bool? hogwartsStaff;
  String? actor;
  bool? alive;
  String? image;
  String? imageBase64;

  Character({
    this.name,
    this.species,
    this.gender,
    this.house,
    this.dateOfBirth,
    this.wizard,
    this.ancestry,
    this.wand,
    this.hogwartsStudent,
    this.hogwartsStaff,
    this.actor,
    this.alive,
    this.image,
    this.imageBase64
  });

  Character.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    species = json['species'];
    gender = json['gender'];
    house = json['house'];
    dateOfBirth = json['dateOfBirth'];
    wizard = json['wizard'];
    ancestry = json['ancestry'];
    wand = json['wand'] != null ? Wand.fromJson(json['wand']) : null;
    hogwartsStudent = json['hogwartsStudent'];
    hogwartsStaff = json['hogwartsStaff'];
    actor = json['actor'];
    alive = json['alive'];
    image = json['image'];
  }

  String getImageUrl() {
    if(image != null){
      if(image!.isNotEmpty){
        return image!;
      }
    }
    return "";
  }

}