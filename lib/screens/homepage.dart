import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String word1 = '';
  String word2 = '';
  String word3 = '';
  String word4 = '';
  String word5 = '';
  String word6 = '';
  String word7 = '';
  String word8 = '';
  String word9 = '';
  String winner;
  int player;
  int player1Won = 0;
  int player2Won = 0;
  String playerName = 'Player 1';
  Color mainColor = Color(0xff536dfe);
  Color purple = Color(0xff536dfe);
  Color green = Color(0xff00bfa5);
  String result;

  findPlayer(spot) {
    if (result == null) {
      setState(() {
        mainColor = player == 1 ? purple : green;
        player = player == 1 ? 2 : 1;
        playerName = player == 1 ? 'Player 2' : 'Player 1';
      });
      assignWord(spot);
    }
  }

  assignWord(int spot) {
    switch (spot) {
      case 1:
        if (word1 == '') {
          word1 = player == 1 ? 'X' : 'O';
        }
        break;
      case 2:
        if (word2 == '') {
          word2 = player == 1 ? 'X' : 'O';
        }
        break;
      case 3:
        if (word3 == '') {
          word3 = player == 1 ? 'X' : 'O';
        }
        break;
      case 4:
        if (word4 == '') {
          word4 = player == 1 ? 'X' : 'O';
        }
        break;
      case 5:
        if (word5 == '') {
          word5 = player == 1 ? 'X' : 'O';
        }
        break;
      case 6:
        if (word6 == '') {
          word6 = player == 1 ? 'X' : 'O';
        }
        break;
      case 7:
        if (word7 == '') {
          word7 = player == 1 ? 'X' : 'O';
        }
        break;
      case 8:
        if (word8 == '') {
          word8 = player == 1 ? 'X' : 'O';
        }
        break;
      case 9:
        if (word9 == '') {
          word9 = player == 1 ? 'X' : 'O';
        }
        break;
    }
    checkWinner();
    if (result == '' || result == null) {
      checkCompleted();
    }
  }

  checkWinner() {
    if (word1 != '' && word1 == word2 && word1 == word3) {
      return scoreCount();
    }
    if (word4 != '' && word4 == word5 && word4 == word6) {
      return scoreCount();
    }
    if (word7 != '' && word7 == word8 && word7 == word9) {
      return scoreCount();
    }
    if (word1 != '' && word1 == word4 && word1 == word7) {
      return scoreCount();
    }
    if (word2 != '' && word2 == word5 && word2 == word8) {
      return scoreCount();
    }
    if (word3 != '' && word3 == word6 && word3 == word9) {
      return scoreCount();
    }
    if (word1 != '' && word1 == word5 && word1 == word9) {
      return scoreCount();
    }
    if (word3 != '' && word3 == word5 && word3 == word7) {
      return scoreCount();
    }
  }

  checkCompleted() {
    if (word1 != '' &&
        word2 != '' &&
        word3 != '' &&
        word4 != '' &&
        word5 != '' &&
        word6 != '' &&
        word7 != '' &&
        word8 != '' &&
        word9 != '') {
      setState(() {
        result = 'Draw';
      });
      resultDialog();
    }
  }

  scoreCount() {
    setState(() {
      if (player == 1) {
        player1Won++;
        result = 'Player 1 Won';
      } else if (player == 2) {
        player2Won++;
        result = 'Player 2 Won';
      }
    });
    resultDialog();
  }

  resultDialog() {
    return showDialog(
      context: context,
      child: SimpleDialog(
        children: <Widget>[
          Center(
            child: Text(
              result,
              style: TextStyle(fontSize: 30),
            ),
          ),
          FlatButton(
            child: Text('Restart'),
            color: Colors.blue,
            onPressed: () => reset(1),
          )
        ],
      ),
    );
  }

  reset(int a) {
    setState(() {
      word1 = '';
      word2 = '';
      word3 = '';
      word4 = '';
      word5 = '';
      word6 = '';
      word7 = '';
      word8 = '';
      word9 = '';
      player = null;
      mainColor = purple;
      playerName = 'Player 1';
      result = null;
    });
    a == 1 ? Navigator.pop(context) : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Player 1',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      player1Won.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.swap_horizontal_circle,
                  color: Colors.white,
                  size: 50,
                ),
                onPressed: () => findPlayer(0),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Player 2',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      player2Won.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
          Text(
            playerName,
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
          GestureDetector(
            onTap: () => reset(0),
            child: Text(
              'Reset',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                            child: Holder(
                              word: word1,
                              top: 0,
                              left: 0,
                              topColor: Colors.white,
                              leftColor: Colors.white,
                              onpressed: () =>
                                  word1 == '' ? findPlayer(1) : null,
                            ),
                          ),
                          Expanded(
                            child: Holder(
                              word: word2,
                              top: 0,
                              topColor: Colors.white,
                              onpressed: () =>
                                  word2 == '' ? findPlayer(2) : null,
                            ),
                          ),
                          Expanded(
                            child: Holder(
                              word: word3,
                              top: 0,
                              right: 0,
                              topColor: Colors.white,
                              rightColor: Colors.white,
                              onpressed: () =>
                                  word3 == '' ? findPlayer(3) : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                            child: Holder(
                              word: word4,
                              left: 0,
                              leftColor: Colors.white,
                              onpressed: () =>
                                  word4 == '' ? findPlayer(4) : null,
                            ),
                          ),
                          Expanded(
                            child: Holder(
                              word: word5,
                              onpressed: () =>
                                  word5 == '' ? findPlayer(5) : null,
                            ),
                          ),
                          Expanded(
                            child: Holder(
                              word: word6,
                              right: 0,
                              rightColor: Colors.white,
                              onpressed: () =>
                                  word6 == '' ? findPlayer(6) : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                            child: Holder(
                              word: word7,
                              left: 0,
                              bottom: 0,
                              leftColor: Colors.white,
                              bottomColor: Colors.white,
                              onpressed: () =>
                                  word7 == '' ? findPlayer(7) : null,
                            ),
                          ),
                          Expanded(
                            child: Holder(
                              word: word8,
                              bottom: 0,
                              bottomColor: Colors.white,
                              onpressed: () =>
                                  word8 == '' ? findPlayer(8) : null,
                            ),
                          ),
                          Expanded(
                            child: Holder(
                              word: word9,
                              right: 0,
                              bottom: 0,
                              rightColor: Colors.white,
                              bottomColor: Colors.white,
                              onpressed: () =>
                                  word9 == '' ? findPlayer(9) : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Holder extends StatelessWidget {
  Holder({
    this.word,
    this.bottom = 2,
    this.left = 2,
    this.right = 2,
    this.top = 2,
    this.topColor = Colors.black,
    this.bottomColor = Colors.black,
    this.rightColor = Colors.black,
    this.leftColor = Colors.black,
    this.onpressed,
  });

  final String word;
  final double top;
  final double bottom;
  final double left;
  final double right;
  final Color topColor;
  final Color bottomColor;
  final Color rightColor;
  final Color leftColor;
  final onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: bottom, color: bottomColor),
          right: BorderSide(width: right, color: rightColor),
          top: BorderSide(width: top, color: topColor),
          left: BorderSide(width: left, color: leftColor),
        ),
      ),
      child: FlatButton(
        child: Text(
          word,
          style: TextStyle(fontSize: 60),
        ),
        onPressed: onpressed,
      ),
    );
  }
}
