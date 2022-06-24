
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oculus_reparo/domain/models/characters/Character.dart';

// this widget draws an avatar, the Character name and the amount of repositories
class CharacterItem extends StatelessWidget {

  final Character character;
  final double width;
  final double height;

  const CharacterItem({
    required this.character,
    required this.width,
    required this.height,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: (){ _tapOnCharacter(character, context); },
    child: Stack(
      children: [

        // this is the characters image
        Image(width: width, height: height, fit: BoxFit.cover, image: _getImage()),

        // this is the characters name placed at the bottom
        Positioned(
            bottom: 0, left: 0, right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 80),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black
                      ]
                  )
              ),
              child: Text(
                  "${character.name}",
                  style: GoogleFonts.tillana(color: Colors.white, fontSize: 32),
                  textAlign: TextAlign.center),
            )
        )
      ]
    )
  );

  ImageProvider _getImage() {
    if(character.image != null){
      if(character.image!.isNotEmpty){
        return NetworkImage(character.image!);
      }
    }
    return const AssetImage('assets/images/background_1.png');
  }

  // show a modal sheet with more info about the character
  _tapOnCharacter(Character character, BuildContext context) {

    const _radiusForBottomSheet = 20.0;
    const _spaceBetweenBottomSheetVertical = 20.0;
    const _spaceBetweenCharacterPropertiesAndValues = 8.0;
    const _textOfCharactersProperties = 18.0;

    showModalBottomSheet(
        backgroundColor: Colors.black,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(_radiusForBottomSheet))
        ),
        builder: (context) => Column(
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
                  Text(
                      "${character.house}",
                      style: GoogleFonts.tillana(color: Colors.white, fontSize: _textOfCharactersProperties),
                      textAlign: TextAlign.center)
                ]
            ),

            // this is the characters age and year of birth
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "Year of birth:",
                      style: GoogleFonts.tillana(color: Colors.white, fontSize: _textOfCharactersProperties),
                      textAlign: TextAlign.center),
                  const SizedBox(width: _spaceBetweenCharacterPropertiesAndValues),
                  Text(
                      "${character.yearOfBirth}",
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
                      "${character.ancestry}",
                      style: GoogleFonts.tillana(color: Colors.white, fontSize: _textOfCharactersProperties),
                      textAlign: TextAlign.center)
                ]
            ),

            const SizedBox(height: _spaceBetweenBottomSheetVertical)

          ],
        )
    );
  }

  String _isThisTrue(bool? value) {
    if(value != null){
      return (value) ? "Yes" : "No";
    }
    return "Unknown";
  }

}
