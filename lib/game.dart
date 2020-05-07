import 'package:flutter/material.dart';
import 'userturns.dart';
import 'package:toast/toast.dart';

class Game extends StatefulWidget {
  final String PlayerX;
  final String PlayerO;
  Game({this.PlayerO, this.PlayerX});

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  UserTurns userTurn;
  @override
  void initState() {
    String O;
    String X;
    super.initState();
    O = widget.PlayerO;
    X = widget.PlayerX;
    userTurn = UserTurns(X, O);
  }

  List<List<String>> states =
      List.generate(3, (_) => List.generate(3, (_) => ''));

  String Player;
  String player;

  int i = 0;
  void updatePlayer() {
    if (i % 2 == 0)
      Player = (widget.PlayerO);
    else {
      Player = (widget.PlayerX);
    }
    player = '$Player\'s Turn';
    i++;
  }

  bool isEmpty(int i, int j) {
    if (states[i][j] != '') {
      Toast.show('Not Allowed', context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
      return (false);
    } else
      return true;
  }

  @override
  Widget build(BuildContext context) {
    updatePlayer();
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic-Tac_Toe'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(player),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RowCard(
                  onPress: () {
                    if (isEmpty(0, 0)) {
                      setState(() {
                        states[0][0] = userTurn.onpress(0, 0, context);
                      });
                    }
                  },
                  child: states[0][0],
                ),
                RowCard(
                  onPress: () {
                    if (isEmpty(0, 1)) {
                      setState(() {
                        states[0][1] = userTurn.onpress(0, 1, context);
                      });
                    }
                  },
                  child: states[0][1],
                ),
                RowCard(
                  onPress: () {
                    if (isEmpty(0, 2)) {
                      setState(() {
                        states[0][2] = userTurn.onpress(0, 2, context);
                      });
                    }
                  },
                  child: states[0][2],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RowCard(
                  onPress: () {
                    if (isEmpty(1, 0)) {
                      setState(() {
                        states[1][0] = userTurn.onpress(1, 0, context);
                      });
                    }
                  },
                  child: states[1][0],
                ),
                RowCard(
                  onPress: () {
                    if (isEmpty(1, 1)) {
                      setState(() {
                        states[1][1] = userTurn.onpress(1, 1, context);
                      });
                    }
                  },
                  child: states[1][1],
                ),
                RowCard(
                  onPress: () {
                    if (isEmpty(1, 2)) {
                      setState(() {
                        states[1][2] = userTurn.onpress(1, 2, context);
                      });
                    }
                  },
                  child: states[1][2],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RowCard(
                  onPress: () {
                    if (isEmpty(2, 0)) {
                      setState(() {
                        states[2][0] = userTurn.onpress(2, 0, context);
                      });
                    }
                  },
                  child: states[2][0],
                ),
                RowCard(
                  onPress: () {
                    if (isEmpty(2, 1)) {
                      setState(() {
                        states[2][1] = userTurn.onpress(2, 1, context);
                      });
                    }
                  },
                  child: states[2][1],
                ),
                RowCard(
                  onPress: () {
                    if (isEmpty(2, 2)) {
                      setState(() {
                        states[2][2] = userTurn.onpress(2, 2, context);
                      });
                    }
                  },
                  child: states[2][2],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RowCard extends StatelessWidget {
  final String child;
  final Function onPress;
  RowCard({this.child, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        color: Colors.blue.shade200,
        child: Container(
          height: 100,
          width: 100,
          child: Center(
            child: Text(child),
          ),
        ),
      ),
    );
  }
}
