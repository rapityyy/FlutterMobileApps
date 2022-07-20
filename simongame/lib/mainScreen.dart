// ignore: prefer_const_constructors
// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:audioplayers/audio_cache.dart';
import 'dart:math';

// class MainScreen extends StatefulWidget {
//   MainScreen({Key? key}) : super(key: key);

//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text("TestData"),
//     );
//   }
// }

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Class constructor
  int level = 0;
  List<String> gamePattern = [];
  List<String> simonColors = ["blue", "green", "red", "yellow"];
  List<String> userChoice = [];
  bool gameStatus = false;

  // AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    // Generate the first color
    if (!gameStatus) {
      //change level display
      nextColor(); // Generate first color
      gameStatus = true; // GAME START!!!!
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {},
          child: const Icon(Icons.umbrella),
        ),
        title: const Center(child: Text("Repeat")),
        actions: const [
          Icon(
            Icons.favorite,
          ),
          Center(child: Text("Level#")),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Level
            Text(
              "Level " + level.toString(),
              style: GoogleFonts.pressStart2p(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),

            //Buttons
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: TextButton(
                          child: const Text("Green"),
                          // color: Colors.green,

                          onPressed: () {
                            _tapped("green");
                          }),
                    ),
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: TextButton(
                          child: const Text("Red"),
                          onPressed: () {
                            _tapped("red");
                          }),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 150,
                      child: TextButton(
                          child: const Text("Yellow"),
                          onPressed: () {
                            _tapped("yellow");
                          }),
                    ),
                    SizedBox(
                      width: 50,
                      height: 150,
                      child: TextButton(
                          child: const Text("Blue"),
                          onPressed: () {
                            _tapped("blue");
                          }),
                    )
                  ],
                ),
              ],
            ),

            //Made by Anhhh
          ],
        ),
      ),
    );
  }

  /* ************************* FUNCTIONS ************************** */

  // NextSequence of Color

  void checkUserInput() {
    int userCurrentSize = userChoice.length - 1;
    if (gamePattern[userCurrentSize] == userChoice[userCurrentSize]) {
      if (gamePattern.length == userChoice.length) {
        nextColor();
      }
    } else {
      print("Game OVER");
      gameStatus = false;
      restartGame();
    }
  }

  void nextColor() {
    setState(() {
      userChoice = [];
      level++;

      Random random = Random();
      int randomIndex = random.nextInt(4);
      gamePattern.add(simonColors[randomIndex]);
      print('gamePattern = ' + gamePattern.toString());
      playSequence();
    });
  }

  // User pressed a button
  void _tapped(chosenColor) {
    setState(() {
      userChoice.add(chosenColor);
      //playSound(chosenColor);
      checkUserInput();
    });
  }

  void playSequence() {
    for (int i = 0; i < gamePattern.length; i++) {
      print('sequence' + i.toString() + ' : ' + gamePattern[i].toString());
      // playSound(gamePattern[i]);
    }
  }

  void playSound(chosenColor) {
    String url = "";
    url = chosenColor.toString() + '.mp3';
    print(url);
    // audioPlayer.play(url);
    // final player = AudioCache();
    // player.play(url);
    // playLocal(url);

    //final player = AudioCache();
    //player.play('assets/sounds/' + chosenColor.toString() + '.mp3');
  }

  void restartGame() {
    level = 0;
    gamePattern = [];
    userChoice = [];
    gameStatus = false;
  }
}

// Border buildBorder() {
//   return Border(
//     left: bs,
//     top: bs,
//   );
// }
