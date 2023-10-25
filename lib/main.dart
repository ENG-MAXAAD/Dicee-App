import 'dart:math';

import 'package:dice_app/util/text.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _Dicee_AppState();
}

class _Dicee_AppState extends State<MyApp> {
  int leftDiceeNumber = 4;
  int rightDiceeNumber = 5;
  int thirdDiceNumber = 1;
  int fourDiceNumber = 2;
  String winners = '';
  int teamOne = 0;
  int teamTwo = 0;
  int score1 = 0;
  int score2 = 0;

  void DiceNumberChanger() {
    setState(() {
      leftDiceeNumber = Random().nextInt(6) + 1;
      rightDiceeNumber = Random().nextInt(6) + 1;
      thirdDiceNumber = Random().nextInt(6) + 1;
      fourDiceNumber = Random().nextInt(6) + 1;

      teamTwo = thirdDiceNumber + fourDiceNumber;
      teamOne = leftDiceeNumber + rightDiceeNumber;

      if (teamOne > teamTwo) {
        winners = ('team One');
      } else if (teamOne < teamTwo) {
        winners = ('team Two');
      } else {
        winners = (' Its Draw');
      }
    });
  }

  void resetScores() {
    setState(() {
      leftDiceeNumber = 1;
      rightDiceeNumber = 1;
      thirdDiceNumber = 1;
      fourDiceNumber = 1;
      teamOne = 0;
      teamTwo = 0;
      winners = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.red,
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text(
              'Dicee',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CText(
                  runningData: "$teamOne",
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Team Two: $teamTwo',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'The Winners is: $winners',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        child: Image.asset(
                            'assets/images/dice$leftDiceeNumber.png'),
                        onPressed: () {
                          DiceNumberChanger();
                          // print('Pressed..');
                        },
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        child: Image.asset(
                            'assets/images/dice$rightDiceeNumber.png'),
                        onPressed: () {
                          DiceNumberChanger();
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        child: Image.asset(
                            'assets/images/dice$thirdDiceNumber.png'),
                        onPressed: () {
                          DiceNumberChanger();
                          // print('Pressed..');
                        },
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        child: Image.asset(
                            'assets/images/dice$fourDiceNumber.png'),
                        onPressed: () {
                          DiceNumberChanger();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  child: Icon(
                    Icons.refresh_sharp,
                    size: 35,
                  ),
                  onPressed: () {
                    resetScores();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
