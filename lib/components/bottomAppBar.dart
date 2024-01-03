// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/material.dart';

class HamburgerMenu extends StatefulWidget {
  const HamburgerMenu({super.key});

  @override
  State<HamburgerMenu> createState() => _HamburgerMenu();
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
                color: const Color(0xffF5A636),
                border: Border.all(
                  color: const Color(0xffF5A636),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/');
                          },
                          child: const Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/catalog');
                          },
                          child: const Icon(
                            Icons.list,
                            color: Colors.white,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/cart');
                          },
                          child: const Icon(
                            Icons.shopping_bag,
                            color: Colors.white,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/account');
                          },
                          child: const Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/settings');
                          },
                          child: const Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
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
