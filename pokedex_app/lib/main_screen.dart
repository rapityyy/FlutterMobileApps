// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'pokemon_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void printTest(context) {
    print("Pressed");
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const PokemonScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Center(
                    child: Text("What Pokemon are you looking for?",
                        style: GoogleFonts.abel(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width / 1.25,
                  //   height: MediaQuery.of(context).size.height / 22,
                  //   //color: Colors.red,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(
                  //       color: Colors.red[500]!,
                  //     ),
                  //     borderRadius: const BorderRadius.all(Radius.circular(20)),
                  //   ),
                  //   child: const IconButton(
                  //     icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
                  //     onPressed: printTest(context),
                  //   ),
                  // ),
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  color: Colors.blue,
                ))
          ],
        ),
      ),
    );
  }
}
