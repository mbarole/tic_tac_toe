import 'package:flutter/material.dart';
import 'package:tictactoe/game.dart';
import 'bottomButton.dart';

String playerX = 'X';
String playerO = 'O';

class PlayerDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic-Tac-Toe'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Player Details'),
            SizedBox(height: 20),
            Player(icon: Icons.close),
            SizedBox(height: 20),
            Player(icon: Icons.fiber_manual_record),
            SizedBox(height: 40),
            BottomButton(
                text: 'Let\'s Go',
                onpress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Game(
                        PlayerO: playerO,
                        PlayerX: playerX,
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class Player extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final icon;
  Player({@required this.icon});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
        ),
        Text(' : '),
        Container(
          width: 300,
          child: TextField(
            controller: _controller,
            autocorrect: false,
            maxLength: 9,
            onChanged: (String str) {
              player(str, icon);
            },
          ),
        ),
      ],
    );
  }

  void player(String name, i) {
    if (i.toString() == 'IconData(U+0E5CD)') {
      if (name == '')
        playerX = 'X';
      else
        playerX = name;
    } else {
      if (name == '')
        playerO = 'O';
      else
        playerO = name;
    }
  }
}
