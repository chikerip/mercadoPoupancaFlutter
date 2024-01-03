// ignore_for_file: file_names, prefer_const_constructors
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
    return Scaffold(
      body: SafeArea(
        top: false,
        //color: Color(0xffD9D9D9),
        child: Container(
          color: Color(0xffD9D9D9),
          child: Stack(
          children: const [
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
        ),
        )
      ),
    );
  }
}

class _AppSeachBar extends State<AppSeachBar>{
  
  String formText = 'aa';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return SafeArea(
      top: false,
      child: Container(
        padding: EdgeInsets.fromLTRB(screenWidth * 0.03, 0, screenWidth * 0.03, 0),
        height: screenheight * 0.09,
        width: screenWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              width: screenWidth * 0.6,
              child: TextField(
              decoration: const InputDecoration(
                border: InputBorder.none, 
                hintText: "Pesquise aqui"
              ),
              onChanged: (text) {
                setState(() {
                  formText = text;
                });
              },
            ),
            ),
            // ignore: sized_box_for_whitespace
            Container(
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(50),
                color: Colors.white,
                ),
              child: IconButton(
                onPressed: () => {
                  Navigator.of(context).pushNamed('/scan', arguments: null),
                }, 
                icon: const Icon(Icons.barcode_reader, color: Colors.black,)
              ),
            ),
            
            Container(
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(50),
                color: Colors.white,
                ),
              child: IconButton(
                onPressed: () => {
                  Navigator.of(context).pushNamed('/filter', arguments: null),
                }, 
                icon: const Icon(Icons.filter_list_outlined, color: Colors.black,)
              ),
            ),
            ],
          ),
        )
    );
  }
}

class _AppBuilderContainer extends State<AppBuilderContainer>{
  //container1 2 * index, container2 (2 * index) + 1;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return ListView.builder(
        itemCount: 25,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            width: screenWidth,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                width: screenWidth * 0.45,
                height: screenheight * 0.26,
                child: Stack(
                  children: [
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network('https://firebasestorage.googleapis.com/v0/b/mercadopoupanca-2aac2.appspot.com/o/products%2FdefaultImg.png?alt=media&token=87a9d1d0-0c2a-49e1-a955-b62fc63636e3',
                    height: screenheight * 0.13,
                    width: screenWidth * 0.40
                    ),
                   
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.01),
                      width: screenWidth * 0.45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Banana',
                          style: TextStyle(
                            fontSize: (screenWidth / screenheight) * 40,
                          ),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '1.99€',
                              style: TextStyle(
                                color: Color(0xffF5A636),
                                fontWeight: FontWeight.bold,
                                fontSize: (screenWidth / screenheight) * 40
                                ),
                              ),
                            Stack(
                              children: [
                                Visibility(
                                  visible: false,
                                  child: Text(
                                    '2.99€',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: (screenWidth / screenheight) * 25
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                  bottom: screenheight * 0.005,
                                  child: Text(
                                  '_______',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: (screenWidth / screenheight) * 25
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    ),
                    
                    Container(
                      padding: EdgeInsets.only(top: !false ? screenheight * 0.02 : 0),
                      margin:EdgeInsets.fromLTRB(screenWidth * 0.03, screenheight * 0.01, screenWidth * 0.03, 0),
                      width: screenWidth * 0.45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network('https://firebasestorage.googleapis.com/v0/b/mercadopoupanca-2aac2.appspot.com/o/stores%2FPingo_Doce_logo.png?alt=media&token=b4eb6870-789e-44d8-ab7a-ddbfed6c047e',
                                height: screenheight * 0.04,
                                width: screenWidth * 0.20
                              ),
                              Visibility(
                                visible: false,
                                child: Text(
                                  'e mais outros',
                                  style: TextStyle(
                                    fontSize: (10)
                                  ),
                                  )
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () => {
                              Navigator.of(context).pushNamed('/product', arguments: null)
                            },
                            child: const Icon(Icons.shopping_basket, color: Colors.black,)
                          ),
                        ],
                    ),
                    )

                  ],
                ),
                   
                    Visibility(
                      visible: (0 > 0),
                      child: Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        height: screenheight * 0.05,
                        width: screenWidth * 0.15,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                          color: Color(0xffF5A636),
                        ),
                        child: Text(
                          '25%',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: (screenWidth / screenheight) * 35,
                            color: Colors.white
                          ),
                        ),
                      )
                    ),
                    )
                    
                  ],
                  )
              ),
              
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                width: screenWidth * 0.45,
                height: screenheight * 0.26,
                child: Stack(
                  children: [
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network('https://firebasestorage.googleapis.com/v0/b/mercadopoupanca-2aac2.appspot.com/o/products%2FdefaultImg.png?alt=media&token=87a9d1d0-0c2a-49e1-a955-b62fc63636e3',
                    height: screenheight * 0.13,
                    width: screenWidth * 0.40
                    ),
                    
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.01),
                      width: screenWidth * 0.45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Banana',
                          style: TextStyle(
                            fontSize: (screenWidth / screenheight) * 40,
                          ),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '1.99€',
                              style: TextStyle(
                                color: Color(0xffF5A636),
                                fontWeight: FontWeight.bold,
                                fontSize: (screenWidth / screenheight) * 40
                                ),
                              ),
                            Stack(
                              children: [
                                Visibility(
                                  visible: true,
                                  child: Text(
                                    '2.99€',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: (screenWidth / screenheight) * 25
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                  bottom: screenheight * 0.005,
                                  child: Text(
                                  '_______',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: (screenWidth / screenheight) * 25
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    ),
                   
                    Container(
                      padding: EdgeInsets.only(top: !true ? screenheight * 0.02 : 0),
                      margin:EdgeInsets.fromLTRB(screenWidth * 0.03, screenheight * 0.01, screenWidth * 0.03, 0),
                      width: screenWidth * 0.45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network('https://firebasestorage.googleapis.com/v0/b/mercadopoupanca-2aac2.appspot.com/o/stores%2FPingo_Doce_logo.png?alt=media&token=b4eb6870-789e-44d8-ab7a-ddbfed6c047e',
                                height: screenheight * 0.04,
                                width: screenWidth * 0.20
                              ),
                              Visibility(
                                visible: true,
                                child: Text(
                                  'e mais outros',
                                  style: TextStyle(
                                    fontSize: (10)
                                  ),
                                  )
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () => {
                              Navigator.of(context).pushNamed('/product', arguments: null)
                            },
                            child: const Icon(Icons.shopping_basket, color: Colors.black,)
                          ),
                        ],
                    ),
                    )
                  ],
                ),
                  
                    Visibility(
                      visible: (1 > 0),
                      child: Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        height: screenheight * 0.05,
                        width: screenWidth * 0.15,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                          color: Color(0xffF5A636),
                        ),
                        child: Text(
                          '25%',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: (screenWidth / screenheight) * 35,
                            color: Colors.white
                          ),
                        ),
                      )
                    ),
                    )
                    
                  ],
                  )
              ),
              
            ],
          ),
          );
        },
      );
  }

}
