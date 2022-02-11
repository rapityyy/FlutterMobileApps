import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:math';

class MainScreen extends StatefulWidget {
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

  AudioPlayer audioPlayer = AudioPlayer();

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
        leading: FlatButton(
          onPressed: () {},
          child: Icon(Icons.umbrella),
        ),
        title: Center(child: Text("Repeat")),
        actions: [
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
            Container(
              child: Text(
                "Level " + level.toString(),
                style: GoogleFonts.pressStart2p(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            //Buttons
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),
                      child: FlatButton(
                          child: Text("Green"),
                          // color: Colors.green,
                          minWidth: 150,
                          height: 150,
                          onPressed: () {
                            _tapped("green");
                          }),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),
                      child: FlatButton(
                          child: Text("Red"),
                          minWidth: 150,
                          height: 150,
                          onPressed: () {
                            _tapped("red");
                          }),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),
                      child: FlatButton(
                          child: Text("Yellow"),
                          minWidth: 150,
                          height: 150,
                          onPressed: () {
                            _tapped("yellow");
                          }),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),
                      child: FlatButton(
                          child: Text("Blue"),
                          minWidth: 150,
                          height: 150,
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

      Random random = new Random();
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
      playSound(chosenColor);
      checkUserInput();
    });
  }

  void playSequence() {
    for (int i = 0; i < gamePattern.length; i++) {
      print('sequence' + i.toString() + ' : ' + gamePattern[i].toString());
      playSound(gamePattern[i]);
    }
  }

  void playSound(chosenColor) {
    String url = "";
    url = chosenColor.toString() + '.mp3';
    print(url);
    // audioPlayer.play(url);
    final player = AudioCache();
    player.play(url);
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
