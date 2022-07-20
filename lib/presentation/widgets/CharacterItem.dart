
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oculus_reparo/base/utilities/MyAssets.dart';
import 'package:oculus_reparo/domain/models/characters/Character.dart';
import 'package:oculus_reparo/presentation/widgets/CharacterInfoBottomSheet.dart';

// this widget draws an avatar, the Character name and the amount of repositories
class CharacterItem extends StatelessWidget {

  final Character character;
  final double width;
  final double height;
  final CharacterItemListener listener;

  const CharacterItem({
    required this.character,
    required this.width,
    required this.height,
    required this.listener,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: (){ _tapOnCharacter(character, context); },
    child: Stack(
      children: [

        // this is the characters image
        _getCharacterImage(),

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

  Widget _getCharacterImage() {
    if(character.imageBase64 != null){
      if(character.imageBase64!.isNotEmpty){
        return Image.memory(base64Decode(character.imageBase64!), width: width, height: height, fit: BoxFit.cover);;
      }
    }
    if(character.image != null){
      if(character.image!.isNotEmpty){
        return CachedNetworkImage(
          width: width, height: height, fit: BoxFit.cover,
          placeholder: (context, url) => Image(image: MyAssets.getThisAssetImage(MyAssets.BLACK_BACKGROUND_WITH_WHITE_LOGO)),
          errorWidget: (context, url, error) => Image(image: MyAssets.getThisAssetImage(MyAssets.BLACK_BACKGROUND_WITH_WHITE_LOGO)),
          imageUrl: character.getImageUrl(),
        );
      }
    }
    return Container(
      width: width, height: height,
      child: Stack(
        children: [
          Image(
              width: width, height: height, fit: BoxFit.cover,
              image: MyAssets.getThisAssetImage(MyAssets.BLACK_BACKGROUND_WITH_WHITE_LOGO)
          ),
          Center(child: ElevatedButton(onPressed: (){ _allowUserToAddImage(); }, child: Text("add image")))
        ],
      ),
    );
  }

  _allowUserToAddImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      final imageBytes = await image.readAsBytes();
      final imageBase64 = base64Encode(imageBytes);
      character.imageBase64 = imageBase64;
      listener.updateCharacter(character);
    }
  }

}

abstract class CharacterItemListener{
  updateCharacter(Character character);
}
