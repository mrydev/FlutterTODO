import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/pages/loading.dart';
import 'package:todoapp/utneed/colors.dart';

void main() async {
  //!Hive
  await Hive.initFlutter();

  //!box
  var box = await Hive.openBox("mrydev");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // debugShowMaterialGrid: true,
      title: 'Todo App ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: MyColors().blue,
          secondary: MyColors().purple,
        ),
      ),
      home: const LoadingScreen(),
    );
  }
}
