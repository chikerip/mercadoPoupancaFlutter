import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mercado Poupança',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class AppAdvertsBar extends StatefulWidget {
  const AppAdvertsBar({super.key});

  @override
  State<AppAdvertsBar> createState() => _AppAdvertsBar();
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

class HamburgerMenu extends StatefulWidget {
  const HamburgerMenu({super.key});

  @override
  State<HamburgerMenu> createState() => _HamburgerMenu();
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

class _AppAdvertsBar extends State<AppAdvertsBar> {
   String img = 'lib/img/NovoProjeto.png';
  int i = 0;
  bool color = true;
  bool imgOpacity = true;

  @override
  void initState () {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();

    Timer.periodic(const Duration(seconds: 10), (timer) {
      setState(() {
        if(i == 0){
          imgOpacity = !imgOpacity;
          color = !color;
          i = i + 1;
        } else {
          imgOpacity = !imgOpacity;
          color = !color;
          i = i - 1;
        }
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Row(
        children: [
          AnimatedContainer(
            onEnd: () {
              setState(() {
                if(i == 0){
                  img = 'lib/img/NovoProjeto.png';
                } else {
                  img = 'lib/img/sddefault.jpg';
                }
                imgOpacity = !imgOpacity;
              });
            },
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
            color: color ? const Color(0xFF508932): Colors.black,
            width: screenWidth,
            height: screenheight * 0.07,
            child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  opacity:  imgOpacity ? 1.0 : 0.0,
                  child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                    img,
                    width: 150,
                    height: 50,
                ),
                 Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.05),
                  child: Text(
                  'Saiba mais',
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: (screenheight / screenWidth) * 8,
                  ),
                ),
                ),
              ],
            ), 
            ),
          ),
        ],
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

class _HamburgerMenu extends State<HamburgerMenu> {
  bool hamburgerOn = false;
  bool iconsHamburgerOn = true;

  @override
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 5, 5),
          child: GestureDetector(
            onTap: () {
              setState(() {
                if(hamburgerOn == false){
                  iconsHamburgerOn = !iconsHamburgerOn;
                }
              });

              Timer(const Duration(milliseconds: 100), () {
                setState(() {
                  if(hamburgerOn == false){
                    hamburgerOn = !hamburgerOn;
                  }
                });
              });
            },
            onHorizontalDragEnd:(details) {
              setState(() {
                if(hamburgerOn == true){
                  iconsHamburgerOn = !iconsHamburgerOn;
                }
              });

              Timer(const Duration(milliseconds: 100), () {
                setState(() {
                  if(hamburgerOn == true){
                    hamburgerOn = !hamburgerOn;
                  }
                });
              });
            },
            child: AnimatedContainer(
              onEnd: () {
                setState(() {
                  iconsHamburgerOn = !iconsHamburgerOn;
                });
              },
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              height: screenheight * 0.1,
              width: hamburgerOn ? screenWidth * 0.95 : screenWidth * 0.22,
              decoration: BoxDecoration(
                color: Colors.yellow,
                border: Border.all(
                  color: Colors.yellow,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(50))
              ),
              child: SafeArea(
                top: false,
                  child: Visibility(
                  visible: hamburgerOn,
                  replacement: AnimatedOpacity(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeOut,
                    opacity: iconsHamburgerOn ? 1 : 0,
                    child: const Icon(
                      Icons.list,
                      color: Colors.white,
                    )
                  ),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeOut,
                    opacity: iconsHamburgerOn ? 1 : 0,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.list,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.shopping_bag,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.account_circle,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
