
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oculus_reparo/base/utilities/MyAssets.dart';
import 'package:oculus_reparo/base/widgets/CharacterInfoBottomSheet.dart';
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
        CachedNetworkImage(
          width: width, height: height, fit: BoxFit.cover,
          placeholder: (context, url) => Image(image: MyAssets.getThisAssetImage(MyAssets.BLACK_BACKGROUND_WITH_WHITE_LOGO)),
          errorWidget: (context, url, error) => Image(image: MyAssets.getThisAssetImage(MyAssets.BLACK_BACKGROUND_WITH_WHITE_LOGO)),
          imageUrl: character.getImageUrl(),
        ),

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

  // show a modal sheet with more info about the character
  _tapOnCharacter(Character character, BuildContext context) {

    const _radiusForBottomSheet = 20.0;

    showModalBottomSheet(
        backgroundColor: Colors.black,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(_radiusForBottomSheet))
        ),
        builder: (context) => CharacterInfoBottomSheet(character: character)
    );
  }

}
