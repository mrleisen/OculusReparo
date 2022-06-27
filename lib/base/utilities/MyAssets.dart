
import 'package:flutter/material.dart';

class MyAssets {

  static String LOGO_1 = "assets/images/logo_1.png";
  static String GRYFFINDOR_LOGO = "assets/images/griffindor.jpg";
  static String SLYTHERIN_LOGO = "assets/images/slytherin.jpg";
  static String RAVENCLAW_LOGO = "assets/images/ravenclaw.jpg";
  static String HUFFLEPUFF_LOGO = "assets/images/hufflepuf.jpg";
  static String BLACK_BACKGROUND_WITH_WHITE_LOGO = "assets/images/background_1.png";

  static AssetImage getThisAssetImage(String assetPath) => AssetImage(assetPath);

}