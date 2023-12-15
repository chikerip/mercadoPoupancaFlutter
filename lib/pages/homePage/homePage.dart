// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:mercadopoupanca/components/AppAdvertsBar.dart';
import 'package:mercadopoupanca/components/bottomAppBar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class AppSeachBar extends StatefulWidget {
  const AppSeachBar({super.key});

  @override
  State<AppSeachBar> createState() => _AppSeachBar();
}

class AppBuilderContainer extends StatefulWidget {
  const AppBuilderContainer({super.key});

  @override
  State<AppBuilderContainer> createState() => _AppBuilderContainer();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Column(
              children: [
                AppAdvertsBar(),
                AppSeachBar(),
                Expanded(
                  child: AppBuilderContainer()
                ),
              ],
            ),
            Positioned(left: 0, bottom: 0, child: HamburgerMenu()),
          ],
        )
      ),
    );
  }
}

class _AppSeachBar extends State<AppSeachBar>{
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return SafeArea(
      top: false,
      child: Container(
        height: screenheight * 0.09,
        width: screenWidth,
        color: Colors.grey,
      ),
    );
  }
}

class _AppBuilderContainer extends State<AppBuilderContainer>{

  @override
  Widget build(BuildContext context) {

    // ignore: avoid_unnecessary_containers
    return ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) {
          return const ListTile(
            title: Text('a'),
          );
        },
      );
  }

}
