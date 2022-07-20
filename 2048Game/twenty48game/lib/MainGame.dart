// ignore_for_file: avoid_print

import 'dart:collection';
import 'dart:developer';
import 'dart:math';
import 'package:matrix2d/matrix2d.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';

class MainGame extends StatefulWidget {
  const MainGame({Key? key}) : super(key: key);

  // MainGame({Key key}) : super(key: key);

  @override
  _MainGameState createState() => _MainGameState();
}

class _MainGameState extends State<MainGame> {
  List myBoard = [
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0]
  ];

  bool changedBoard = false;
  int rowBoard = -1;
  int colBoard = -1;
  int totalScore = 0;

  // Return to Main Meny Screen
  void nothing() {}

  void clearBoard() {
    myBoard = [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0]
    ];
  }

  void spawnNewRandomTile() {
    // randomize col and row    Random().nextInt(10); >= 0 to <10
    int row = Random().nextInt(4);
    int col = Random().nextInt(4);

    // While new position is not 0 (empty)
    while (myBoard[row][col] != 0) {
      row = Random().nextInt(4);
      col = Random().nextInt(4);
    }

    // Initialize new tile with value of 2. Sometimes the game start with spawn values = (4,2) or (4,4) -> make it randomly chooses 4
    if (Random().nextInt(4) == 2) {
      myBoard[row][col] = 4;
    } else {
      myBoard[row][col] = 2;
    }
  }

  void _initBoard() {
    totalScore = 0;
    clearBoard();
    spawnNewRandomTile();
    spawnNewRandomTile();

    setState(() {
      //self.printBoard()
    });
  }

  void _checkWin() {
    //if find 2048, return win
    for (int r = 0; r < 4; r++) {
      for (int c = 0; c < 4; c++) {
        if (myBoard[r][c] == 2048) {
          //return 'W'; //pop the winning screen here
          _displayWinner("W");
        }
      }
    }

    //if 0 is on the board, continue the game
    for (int r = 0; r < 4; r++) {
      for (int c = 0; c < 4; c++) {
        if (myBoard[r][c] == 0) {
          //return 'Y'; //Continue the game
          return;
        }
      }
    }

    //Check for dups tiles, continue if do
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        if (0 <= i - 1 && i - 1 <= 3) {
          if (myBoard[i][j] == myBoard[i - 1][j]) {
            //return 'Y'; //continue the game
            return;
          }
        }
        if (0 <= j - 1 && j - 1 <= 3) {
          if (myBoard[i][j] == myBoard[i][j - 1]) {
            //return 'Y'; //continue the game
            return;
          }
        }
        if (0 <= i + 1 && i + 1 <= 3) {
          if (myBoard[i][j] == myBoard[i + 1][j]) {
            //return 'Y'; //continue the game
            return;
          }
        }
        if (0 <= j + 1 && j + 1 <= 3) {
          if (myBoard[i][j] == myBoard[i][j + 1]) {
            //return 'Y'; //continue the game
            return;
          }
        }
      }
    }

    //return 'N';   // End the game
    _displayWinner("N");
  }

  void _displayWinner(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          if (winner == "W") {
            return AlertDialog(
              title: Text(
                "You've won the 2048 game!!!\n Score: " +
                    totalScore.toString() +
                    ".",
                style: GoogleFonts.fredokaOne(
                  color: Colors.black,
                  textStyle: Theme.of(context).textTheme.headline1,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: <Widget>[
                TextButton(
                  //color: Colors.lightBlue,
                  onPressed: () {
                    //final player = AudioCache();
                    //player.play('mainmenu.mp3');
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Main Menu",
                    style: GoogleFonts.fredokaOne(
                      color: Colors.blue,
                      textStyle: Theme.of(context).textTheme.headline1,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                TextButton(
                    //color: Colors.red,
                    child: Text(
                      "Play Again!",
                      style: GoogleFonts.fredokaOne(
                        color: Colors.blue,
                        textStyle: Theme.of(context).textTheme.headline1,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {
                      //final player = AudioCache();
                      //player.play('playagain.mp3');

                      _initBoard();
                      Navigator.of(context)
                          .pop(); // Pop/Get rid of the aleart box
                    })
              ],
            );
          } else {
            return AlertDialog(
              title: Text(
                "You have lost the game!!!\n Score: " +
                    totalScore.toString() +
                    ".",
                style: GoogleFonts.fredokaOne(
                  color: Colors.black,
                  textStyle: Theme.of(context).textTheme.headline1,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: <Widget>[
                TextButton(
                  //color: Colors.lightBlue,
                  onPressed: () {
                    //final player = AudioCache();
                    //player.play('mainmenu.mp3');

                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Main Menu",
                    style: GoogleFonts.fredokaOne(
                      color: Colors.blue,
                      textStyle: Theme.of(context).textTheme.headline1,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                TextButton(
                    //color: Colors.red,
                    child: Text(
                      "Play Again!",
                      style: GoogleFonts.fredokaOne(
                        color: Colors.blue,
                        textStyle: Theme.of(context).textTheme.headline1,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {
                      //final player = AudioCache();
                      //player.play('playagain.mp3');

                      _initBoard();
                      Navigator.of(context).pop(); // Get rid of the alert box
                    })
              ],
            );
          }
        });
    //return;
  }

  void shiftAllLeft() {
    //move everything to the left if there's exist a 0 on the left side
    for (int r = 0; r < 4; r++) {
      for (int i = 0; i < 4; i++) {
        if (myBoard[r][i] == 0) {
          for (int n = i; n < 4; n++) {
            if (myBoard[r][n] != 0) {
              myBoard[r][i] = myBoard[r][n];
              myBoard[r][n] = 0;
              changedBoard = true;
              break;
            }
          }
        }
      }
    }
  }

  void moveLeft() {
    changedBoard = false;
    shiftAllLeft();

    int index1;
    int index2;
    // Then MERGE dups
    for (int r = 0; r < 4; r++) {
      index1 = 0;
      index2 = 1;
      while (index1 != 3 && index2 != 4) {
        if (myBoard[r][index1] == myBoard[r][index2] &&
            myBoard[r][index1] != 0 &&
            myBoard[r][index2] != 0) {
          myBoard[r][index1] += myBoard[r][index2];
          myBoard[r][index2] = 0;
          changedBoard = true;
          // TODO:
          totalScore += int.parse(myBoard[r][index1].toString());
        }
        index1++;
        index2++;
      }
    }
    shiftAllLeft();
  }

  void moveRight() {
    changedBoard = false;
    flipListTemp();
    moveLeft();
    flipListTemp();
  }

  void moveUp() {
    changedBoard = false;
    myBoard = myBoard.transpose;
    moveLeft();
    myBoard = myBoard.transpose;
  }

  void moveDown() {
    changedBoard = false;
    myBoard = myBoard.transpose;
    moveRight();
    myBoard = myBoard.transpose;
  }

  void flipListTemp() {
    int temp;
    for (int r = 0; r < 4; r++) {
      if (myBoard[r] != [0, 0, 0, 0]) {
        // flip 0 - 3
        temp = myBoard[r][0];
        myBoard[r][0] = myBoard[r][3];
        myBoard[r][3] = temp;
        //flip 1 - 2
        temp = myBoard[r][1];
        myBoard[r][1] = myBoard[r][2];
        myBoard[r][2] = temp;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _initBoard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text(
                        "2048",
                        style: GoogleFonts.fredokaOne(
                          color: Colors.white,
                          textStyle: Theme.of(context).textTheme.headline1,
                          fontSize: 30,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                    decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ))),
                Column(
                  children: [
                    Container(
                        width: 100,
                        height: 50,
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                "Score",
                                style: GoogleFonts.fredokaOne(
                                  color: Colors.white,
                                  textStyle:
                                      Theme.of(context).textTheme.headline1,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                totalScore.toString(),
                                style: GoogleFonts.fredokaOne(
                                  color: Colors.white,
                                  textStyle:
                                      Theme.of(context).textTheme.headline1,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                          ],
                        ),
                        decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ))),
                    const SizedBox(height: 10),
                    Container(
                        decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )),
                        width: 100,
                        height: 50,
                        child: TextButton(
                            //color: Colors.red,
                            child: Center(
                              child: Text(
                                "Menu",
                                style: GoogleFonts.fredokaOne(
                                  color: Colors.white,
                                  textStyle:
                                      Theme.of(context).textTheme.headline1,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }))
                  ],
                ),
              ],
            ),

            Text(
              "Join the numbers and get to 2048 tiles!",
              style: GoogleFonts.fredokaOne(
                color: Colors.white,
                textStyle: Theme.of(context).textTheme.headline1,
                fontSize: 20,
                fontWeight: FontWeight.w100,
              ),
            ),

            //Board and Directional Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(width: 40, height: 40),
                SizedBox(
                    width: 600,
                    height: 600,
                    child: Expanded(
                        flex: 4,
                        child: GridView.builder(
                            padding: const EdgeInsets.all(30.0),
                            itemCount: 16,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  decoration:
                                      BoxDecoration(border: buildBorder(index)),
                                  child: Center(
                                      child: PlayerColor(myBoard, index)));
                            }))),
                SizedBox(
                  child: Expanded(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          iconSize: 50,
                          color: Colors.white,
                          onPressed: () {
                            print("Up Pressed");
                            moveUp();
                            if (changedBoard) {
                              spawnNewRandomTile();
                            }
                            setState(() {});
                            _checkWin();
                          },
                          icon: const Icon(
                            Icons.arrow_circle_up_outlined,
                          ),
                        ),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              iconSize: 50,
                              color: Colors.white,
                              onPressed: () {
                                print("Left Pressed");
                                moveLeft();
                                if (changedBoard) {
                                  spawnNewRandomTile();
                                }
                                setState(() {});
                                _checkWin();
                              },
                              icon: const Icon(
                                Icons.arrow_circle_left_outlined,
                              ),
                            ),
                            IconButton(
                              iconSize: 50,
                              color: Colors.white,
                              onPressed: () {
                                print("Down Pressed");
                                moveDown();
                                if (changedBoard) {
                                  spawnNewRandomTile();
                                }
                                setState(() {});
                                _checkWin();
                              },
                              icon: const Icon(
                                Icons.arrow_circle_down_outlined,
                              ),
                            ),
                            IconButton(
                              iconSize: 50,
                              color: Colors.white,
                              onPressed: () {
                                print("Right Pressed");
                                moveRight();
                                if (changedBoard) {
                                  spawnNewRandomTile();
                                }
                                setState(() {});
                                _checkWin();
                              },
                              icon: const Icon(
                                Icons.arrow_circle_right_outlined,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerColor extends StatefulWidget {
  final List myBoard;
  final index;

  const PlayerColor(this.myBoard, this.index, {Key? key}) : super(key: key);

  @override
  State<PlayerColor> createState() => _PlayerColorState();
}

class _PlayerColorState extends State<PlayerColor> {
  // 2,4,8,16,64,128,512,1024,2048
  Map<int, Color> tileColor = {
    0: Colors.black,
    2: Colors.white,
    4: Colors.amber[50]!,
    8: Colors.orange[200]!,
    16: Colors.orange,
    32: Colors.orange[500]!,
    64: Colors.orange[900]!,
    128: Colors.amber[100]!,
    512: Colors.amber[200]!,
    1024: Colors.amber[300]!,
    2048: Colors.amber,
  };

  Map<int, List<int>> boardCoord = {
    0: [0, 0],
    1: [0, 1],
    2: [0, 2],
    3: [0, 3],
    4: [1, 0],
    5: [1, 1],
    6: [1, 2],
    7: [1, 3],
    8: [2, 0],
    9: [2, 1],
    10: [2, 2],
    11: [2, 3],
    12: [3, 0],
    13: [3, 1],
    14: [3, 2],
    15: [3, 3],
  };

  @override
  Widget build(BuildContext context) {
    Color c;
    int leftIndex = boardCoord[widget.index]![0];
    int rightIndex = boardCoord[widget.index]![1];
    int currentTileVal = widget.myBoard[leftIndex][rightIndex];
    String tileText = "";
    int tileValue = widget.myBoard[leftIndex][rightIndex];

    if (tileValue != 0 && tileColor.containsKey(currentTileVal)) {
      c = tileColor[currentTileVal]!;
      tileText = tileValue.toString();
    } else {
      tileText = "";
      c = Colors.blue;
    }

    return Text(
      tileText,
      style: GoogleFonts.fredokaOne(
        color: c,
        textStyle: Theme.of(context).textTheme.headline1,
        fontSize: 30,
        fontWeight: FontWeight.w100,
      ),
    );
  }
}

/* ********** OTHER FUNCTIONS HELPER/BUILDER ********** */
Border buildBorder(index) {
  double w = 0.20;
  Color c = Colors.lightBlue;
  BorderSide bs = BorderSide(width: w, color: c);

  if ([0, 1, 2, 4, 5, 6, 8, 9, 10].contains(index)) {
    return Border(top: bs, left: bs);
  } else if ([3, 7, 11].contains(index)) {
    return Border(left: bs, top: bs, right: bs);
  } else if ([12, 15].contains(index)) {
    return Border(top: bs, left: bs, bottom: bs, right: bs);
  } else if (index == 13) {
    return Border(top: bs, bottom: bs);
  } else if (index == 14) {
    return Border(left: bs, bottom: bs, top: bs);
  } else {
    print("ELSE");
  }
  return Border(left: bs, bottom: bs, right: bs);
}
