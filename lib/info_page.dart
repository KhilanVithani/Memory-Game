import 'package:flutter/material.dart';
import 'utils.dart' as utils;

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utils.blueColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: utils.blueColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(color: utils.blueColor),
                child: Container(
                    width: double.infinity,
                    height: 225,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const CircleAvatar(
                            radius: 55,
                            backgroundColor: utils.redColor,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/box.png'),
                              radius: 50.0,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text(
                            'Memories',
                            style:
                                TextStyle(fontSize: 22.0, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: const BoxDecoration(color: utils.blueColor),
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'What is Memory Game?',
                          style: TextStyle(
                              fontSize: 22.0,
                              color: utils.whiteColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "It's a memory game that consists of finding the pairs of cards that show up on the screen. The objective is to find all the pairs of cards before the time runs out.",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: utils.whiteColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
