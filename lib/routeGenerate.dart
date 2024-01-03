// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:mercadopoupanca/pages/barcodeScanPage/barcodeScanPage.dart';
import 'package:mercadopoupanca/pages/filterPage/filterPage.dart';
import 'package:mercadopoupanca/pages/homePage/homePage.dart';
import 'package:mercadopoupanca/pages/productPage/productPage.dart';
// ignore: unused_import

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    
    // ignore: unused_local_variable
    final args = settings.arguments;

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => const MyHomePage());
        //Navigator.of(context).pushNamed(
        //'/scan',
        //arguments: data
        //);
      case '/scan':
       return MaterialPageRoute(builder: (_)=> const barcodeScan());
      
      case '/filter':
        return MaterialPageRoute(builder: (_)=> const filterPage());

      case '/product':
        return MaterialPageRoute(builder: (_)=>const productsPage());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: const Text('error'),
        ),
        body: const Center(
          child: Text('error'),
        ),
      );
    });
  }
}