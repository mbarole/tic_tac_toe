import 'package:flutter/material.dart';
import 'results.dart';

class UserTurns {
  int winnerFound = 0;
  int _i;
  List<List<String>> _states;
  String xPlayer;
  String oPlayer;

  UserTurns(String x, String o) {
    _i = 0;
    _states = List.generate(3, (_) => List.generate(3, (_) => ''));
    xPlayer = x;
    oPlayer = o;
  }

  String onpress(int row, int col, BuildContext context) {
    _i++;
    if (_i % 2 == 0 && _states[row][col] == '') {
      _states[row][col] = 'X';
      if (_i > 4) {
        _results(context);
      }
      return 'X';
    } else if (_states[row][col] == '' && _i % 2 != 0) {
      _states[row][col] = 'O';
      if (_i > 4) {
        _results(context);
      }
      return 'O';
    }
  }

  void _results(BuildContext context) {
    _checkRow(context);
    _checkColumn(context);
    _checkDiagonal(context);
    if (winnerFound == 0 && _i >= 9) navigate(context, 'jai', '*');
  }

  void _checkRow(BuildContext context) {
    for (int z = 0; z < 3; z++) {
      if (_states[z][0] == 'X' &&
          _states[z][1] == 'X' &&
          _states[z][2] == 'X') {
        winnerFound = 1;
        navigate(context, xPlayer, 'X');
      } else if (_states[z][0] == 'O' &&
          _states[z][1] == 'O' &&
          _states[z][2] == 'O') {
        winnerFound = 1;
        navigate(context, oPlayer, 'O');
      }
    }
  }

  void _checkColumn(BuildContext context) {
    for (int z = 0; z < 3; z++) {
      if (_states[0][z] == 'X' &&
          _states[1][z] == 'X' &&
          _states[2][z] == 'X') {
        winnerFound = 1;
        navigate(context, xPlayer, 'X');
      } else if (_states[0][z] == 'O' &&
          _states[1][z] == 'O' &&
          _states[2][z] == 'O') {
        winnerFound = 1;
        navigate(context, oPlayer, 'O');
      }
    }
  }

  void _checkDiagonal(BuildContext context) {
    if (_states[0][0] == 'X' && _states[1][1] == 'X' && _states[2][2] == 'X') {
      winnerFound = 1;
      navigate(context, xPlayer, 'X');
    } else if (_states[0][0] == 'O' &&
        _states[1][1] == 'O' &&
        _states[2][2] == 'O') {
      winnerFound = 1;
      navigate(context, oPlayer, 'O');
    } else if (_states[0][2] == 'O' &&
        _states[1][1] == 'O' &&
        _states[2][0] == 'O') {
      winnerFound = 1;
      navigate(context, oPlayer, 'O');
    } else if (_states[0][2] == 'X' &&
        _states[1][1] == 'X' &&
        _states[2][0] == 'X') {
      winnerFound = 1;
      navigate(context, xPlayer, 'X');
    }
  }

  void navigate(BuildContext context, String winner, String check) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) => Results(
                winner: winner,
                check: check,
              )),
      ModalRoute.withName('/'),
    );
  }
}
