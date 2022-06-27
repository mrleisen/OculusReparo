
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oculus_reparo/base/utilities/MyAssets.dart';
import 'package:oculus_reparo/domain/models/characters/Character.dart';

class CharacterInfoBottomSheet extends StatelessWidget {

  final Character character;

  const CharacterInfoBottomSheet({
    required this.character,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const _spaceBetweenBottomSheetVertical = 20.0;
    const _spaceBetweenCharacterPropertiesAndValues = 8.0;
    const _textOfCharactersProperties = 18.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        // this is a space space
        const SizedBox(height: _spaceBetweenBottomSheetVertical),

        // this is the characters name
        Text(
            "${character.name}",
            style: GoogleFonts.tillana(color: Colors.white, fontSize: 32),
            textAlign: TextAlign.center),

        // divider
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
            child: const Divider(height: 1,color: Colors.white)
        ),

        // this is the characters house
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "House:",
                  style: GoogleFonts.tillana(color: Colors.white, fontSize: _textOfCharactersProperties),
                  textAlign: TextAlign.center),
              const SizedBox(width: _spaceBetweenCharacterPropertiesAndValues),
              Row(
                children: [
                  InkWell(
                    onTap: (){ _showDialogWithImage(_getHouseLogoImage(character.house), context); },
                    child: Container(
                      width: 30, height: 30,
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                      child: _getHouseLogoImage(character.house),
                    )
                  ),
                  const SizedBox(width: _spaceBetweenCharacterPropertiesAndValues),
                  Text(
                      "${character.house}",
                      style: GoogleFonts.tillana(color: Colors.white, fontSize: _textOfCharactersProperties),
                      textAlign: TextAlign.center)
                ],
              )
            ]
        ),

        // this is the characters age and year of birth
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Date of birth:",
                  style: GoogleFonts.tillana(color: Colors.white, fontSize: _textOfCharactersProperties),
                  textAlign: TextAlign.center),
              const SizedBox(width: _spaceBetweenCharacterPropertiesAndValues),
              Text(
                  "${character.dateOfBirth}",
                  style: GoogleFonts.tillana(color: Colors.white, fontSize: _textOfCharactersProperties),
                  textAlign: TextAlign.center)
            ]
        ),

        // this is the characters species
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Species:",
                  style: GoogleFonts.tillana(color: Colors.white, fontSize: _textOfCharactersProperties),
                  textAlign: TextAlign.center),
              const SizedBox(width: _spaceBetweenCharacterPropertiesAndValues),
              Text(
                  "${character.species}",
                  style: GoogleFonts.tillana(color: Colors.white, fontSize: _textOfCharactersProperties),
                  textAlign: TextAlign.center)
            ]
        ),

        // this is the characters it's a wizard
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Is a wizard?",
                  style: GoogleFonts.tillana(color: Colors.white, fontSize: _textOfCharactersProperties),
                  textAlign: TextAlign.center),
              const SizedBox(width: _spaceBetweenCharacterPropertiesAndValues),
              Text(
                  _isThisTrue(character.wizard),
                  style: GoogleFonts.tillana(color: Colors.white, fontSize: _textOfCharactersProperties),
                  textAlign: TextAlign.center)
            ]
        ),

        // this is the characters it's alvie
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "It's alive?",
                  style: GoogleFonts.tillana(color: Colors.white, fontSize: _textOfCharactersProperties),
                  textAlign: TextAlign.center),
              const SizedBox(width: _spaceBetweenCharacterPropertiesAndValues),
              Text(
                  _isThisTrue(character.alive),
                  style: GoogleFonts.tillana(color: Colors.white, fontSize: _textOfCharactersProperties),
                  textAlign: TextAlign.center)
            ]
        ),

        // this is the characters  it's a hogwarts student
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "It's a Hogwarts student?",
                  style: GoogleFonts.tillana(color: Colors.white, fontSize: _textOfCharactersProperties),
                  textAlign: TextAlign.center),
              const SizedBox(width: _spaceBetweenCharacterPropertiesAndValues),
              Text(
                  _isThisTrue(character.hogwartsStudent),
                  style: GoogleFonts.tillana(color: Colors.white, fontSize: _textOfCharactersProperties),
                  textAlign: TextAlign.center)
            ]
        ),

        // this is the characters it's a hogwarts staff
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "It's a Hogwarts staff?",
                  style: GoogleFonts.tillana(color: Colors.white, fontSize: _textOfCharactersProperties),
                  textAlign: TextAlign.center),
              const SizedBox(width: _spaceBetweenCharacterPropertiesAndValues),
              Text(
                  _isThisTrue(character.hogwartsStaff),
                  style: GoogleFonts.tillana(color: Colors.white, fontSize: _textOfCharactersProperties),
                  textAlign: TextAlign.center)
            ]
        ),

        // this is the characters ancentry
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Ancestry:",
                  style: GoogleFonts.tillana(color: Colors.white, fontSize: _textOfCharactersProperties),
                  textAlign: TextAlign.center),
              const SizedBox(width: _spaceBetweenCharacterPropertiesAndValues),
              Text(
                  "$character.ancestry",
                  style: GoogleFonts.tillana(color: Colors.white, fontSize: _textOfCharactersProperties),
                  textAlign: TextAlign.center)
            ]
        ),

        const SizedBox(height: _spaceBetweenBottomSheetVertical)

      ],
    );
  }

  String _isThisTrue(bool? value) {
    if(value != null){
      return (value) ? "Yes" : "No";
    }
    return "Unknown";
  }

  Image _getHouseLogoImage(String? houseName){
    if(houseName != null){
      switch(houseName){
        case "Gryffindor": {
          return Image(image: MyAssets.getThisAssetImage(MyAssets.GRYFFINDOR_LOGO));
        }
        case "Slytherin": {
          return Image(image: MyAssets.getThisAssetImage(MyAssets.SLYTHERIN_LOGO));
        }
        case "Hufflepuff": {
          return Image(image: MyAssets.getThisAssetImage(MyAssets.HUFFLEPUFF_LOGO));
        }
        case "Ravenclaw": {
          return Image(image: MyAssets.getThisAssetImage(MyAssets.RAVENCLAW_LOGO));
        }
        default:{
          return Image(image: MyAssets.getThisAssetImage(MyAssets.LOGO_1));
        }
      }
    }
    return Image(image: MyAssets.getThisAssetImage(MyAssets.LOGO_1));
  }

  _showDialogWithImage(Image image, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: image,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('DISMISS'),
          )
        ]
      )
    );
  }

}
