import 'package:flutter/material.dart';
import 'bottomButton.dart';

class Results extends StatelessWidget {
  final winner;
  final check;
  Results({this.winner, this.check});

  bool result;
  void drawcheck() {
    if (check != '*')
      result = true;
    else
      result = false;
  }

  @override
  Widget build(BuildContext context) {
    drawcheck();
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic-Tac-Toe'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Visibility(
                visible: result,
                child: Column(
                  children: <Widget>[
                    Text('The Winner Is'),
                    Text(winner),
                  ],
                ),
              ),
              Visibility(
                visible: (!result),
                child: Column(
                  children: <Widget>[
                    Text('Its A Draw'),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              BottomButton(
                text: 'Go Again',
                onpress: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
