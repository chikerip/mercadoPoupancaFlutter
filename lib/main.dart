import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mercadopoupanca/routeGenerate.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox('localStorage');


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      title: 'Mercado Poupança',
      initialRoute: '/register',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}