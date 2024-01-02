// ignore_for_file: file_names, camel_case_types, unnecessary_cast
import 'package:flutter/material.dart';
import 'package:mercadopoupanca/components/AppAdvertsBar.dart';

class productsPage extends StatefulWidget {
  const productsPage({super.key});

  @override
  State<productsPage> createState() => _productsPage();
}

class _productsPage extends State<productsPage> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          const AppAdvertsBar(),
          Image.network('https://firebasestorage.googleapis.com/v0/b/mercadopoupanca-2aac2.appspot.com/o/products%2FdefaultImg.png?alt=media&token=87a9d1d0-0c2a-49e1-a955-b62fc63636e3',
          width: screenWidth,
          height: screenheight * 0.3,),
          const Text('banana')
        ],
      ),
    );
  }
}
