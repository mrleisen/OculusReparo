
import 'package:flutter/material.dart';
import 'package:oculus_reparo/presentation/home/HomeScreenView.dart';
import 'base/utilities/DependencyInjector.dart' as dependencyInjection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{

  const MyApp({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreenView(),
      );

}