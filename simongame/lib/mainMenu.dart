// ignore: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:audioplayers/audio_cache.dart';

import "mainScreen.dart";

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              "Simon Game",
              style: GoogleFonts.pressStart2p(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: 200.0,
            child: TextButton(
              child: Text(
                "Start",
                style: GoogleFonts.pressStart2p(
                  color: Colors.black,
                  textStyle: Theme.of(context).textTheme.headline1,
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MainScreen()));
              },
            ),
          ),
        ],
      )),
    );
  }
}
