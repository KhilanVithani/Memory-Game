import 'package:flutter/material.dart';
import 'package:memorygame/utils.dart' as utils;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: const Icon(Icons.question_mark_rounded),
                onPressed: () {
                  Navigator.pushNamed(context, 'info');
                }),
          )
        ],
        title: Text('Memory Game'),
        backgroundColor: utils.blueColor,
      ),
      body: Container(
        color: utils.blueColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image(
                  image: AssetImage('assets/images/Memories.png'),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'game',
                      arguments: {'level': 'easy'});
                },
                child: Text(
                  'Easy',
                  style: TextStyle(
                      color: utils.whiteColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'game',
                      arguments: {'level': 'medium'});
                },
                child: Text(
                  'Medium',
                  style: TextStyle(
                      color: utils.whiteColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'game',
                      arguments: {'level': 'hard'});
                },
                child: Text(
                  'Difficult',
                  style: TextStyle(
                      color: utils.whiteColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
