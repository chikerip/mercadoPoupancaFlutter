import 'package:flutter/material.dart';
import 'package:mercadopoupanca/routeGenerate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mercado Poupança',
      initialRoute: '/scan',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}