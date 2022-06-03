import 'dart:async';
import 'package:flutter/material.dart';
import 'package:memorygame/game/game_logic.dart';
import 'package:memorygame/game/widgets/board.dart';
import 'package:memorygame/game/widgets/dialoag.dart';
import 'package:memorygame/utils.dart' as utils;

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  final GameLogic _game = GameLogic();
  int tries = 0;
  var score = 0;
  var axisCount = 4;
  late Timer timer;
  int startTimer = 60;
  var complete = 0;

  void StartTimer(BuildContext context) {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer) {
      if (startTimer == 0) {
        timer.cancel();
        _showDialog(context, 'Game Over', 'Your Score is: $score');
      } else {
        setState(() {
          startTimer--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    StartTimer(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _game.initGame(context);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    // String level = arguments['level'] as String;
    // print(level);
    // if (level == 'easy' || level == 'medium') {
    //   axisCount = 4;
    // } else {
    //   axisCount = 6;
    // }

    // if (level == 'medium') {
    //   _game.cardCount = 24;
    // }

    return WillPopScope(
      onWillPop: () async {
        bool willLeave = false;
        timer.cancel();
        // show the confirm dialog
        await showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: const Text('Are you sure you want to quit the Game'),
                  actions: [
                    ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: utils.redColor),
                        onPressed: () {
                          willLeave = true;
                          Navigator.of(context).pop();
                        },
                        child: const Text('Yes')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          StartTimer(context);
                        },
                        child: const Text(
                          'No',
                          style: TextStyle(color: utils.blueColor),
                        ))
                  ],
                ));
        return willLeave;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: utils.redColor,
        ),
        backgroundColor: utils.redColor,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                board('Time', '$startTimer'),
                board('Score', '$score'),
                board('Moves', '$tries'),
              ],
            ),
            SizedBox(
              height: screenWidth,
              width: screenWidth,
              child: GridView.builder(
                itemCount: _game.cardsImg!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _game.axiCount,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                padding: EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          tries++;
                          print(tries);
                          _game.cardsImg![index] = _game.card_list[index];
                          _game.matchCheck.add(
                            {index: _game.card_list[index]},
                          );
                          if (_game.matchCheck.length == 2) {
                            if (_game.matchCheck[0].values.first ==
                                _game.matchCheck[1].values.first) {
                              score += 100;
                              _game.matchCheck.clear();
                              complete += 1;
                              if (complete * 2 == _game.cardCount) {
                                _showDialog(context, 'You Won ',
                                    'Your Score is: $score');
                                timer.cancel();
                              }
                            } else {
                              Future.delayed(
                                const Duration(milliseconds: 300),
                                () {
                                  setState(() {
                                    _game.cardsImg![_game.matchCheck[0].keys
                                        .first] = _game.hiddenCard;
                                    _game.cardsImg![_game.matchCheck[1].keys
                                        .first] = _game.hiddenCard;

                                    _game.matchCheck.clear();
                                  });
                                },
                              );
                            }
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: utils.whiteColor,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage(_game.cardsImg![index]),
                              fit: BoxFit.cover),
                        ),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, String title, String info) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(info),
            actions: <Widget>[
              TextButton(
                child: const Text('Go to Start'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, 'home');
                },
              ),
            ],
          );
        });
  }
}
