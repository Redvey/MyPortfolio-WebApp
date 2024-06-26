import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../consts/data.dart';

class Players {
  String? X;
  String? O;
  String noPlayer = '';

  Players(this.X, this.O);
}

class Utils {
  static List<Widget> modelBuilder<M>(
      List<M> models, Widget Function(int index, M model) builder) {
    return models
        .asMap()
        .map<int, Widget>(
            (index, model) => MapEntry(index, builder(index, model)))
        .values
        .toList();
  }
}

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  GameBoardState createState() =>
      GameBoardState(); // a developer would usually use _classname_State
}

class GameBoardState extends State<GameBoard> {
  late List<List<String>> matrix;
  final int matrixSize = 3;
  int playerXScore = 0;
  int playerOScore = 0;
  late Players p;
  late String lastMove = '';

  bool showCelebration = false; // Initially, set the animation to be hidden.

  @override
  void initState() {
    super.initState();
    p = Players('🍳', '🥚');
    setEmptyFields();
  }

  void setEmptyFields() {
    matrix = List.generate(
        matrixSize, (_) => List.generate(matrixSize, (_) => p.noPlayer));
  }

  @override
  Widget build(BuildContext context) {
    String? nextPlayer = lastMove == p.X ? p.O : p.X;
    return Scaffold(
      backgroundColor: getPlayerColor(nextPlayer!).withAlpha(150),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: CustomGradient.secondGradient,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.9),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(children: [
                            Text(
                              "PLAYER ${p.X}",
                              style: GoogleFonts.comicNeue(
                                  color: Colors.black, fontSize: 22),
                            ),
                            Text(
                              " $playerXScore",
                              style: GoogleFonts.comicNeue(
                                  color: Colors.black, fontSize: 22),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: CustomGradient.primaryGradient,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.9),
                              spreadRadius: 4,
                              blurRadius: 7,
                              offset: const Offset(0, 2),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(children: [
                            Text(
                              "PLAYER ${p.O}",
                              style: GoogleFonts.comicNeue(
                                  color: Colors.black, fontSize: 22),
                            ),
                            Text(
                              " $playerOScore",
                              style: GoogleFonts.comicNeue(
                                  color: Colors.black, fontSize: 22),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: Utils.modelBuilder(
                  matrix,
                  (x, value) => buildRow(x),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white)),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(7),
                      child: Text(
                        "Player ${lastMove == p.X ? p.O : p.X}'s Turn",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // The Lottie animation (initially hidden)
          Visibility(
            visible: showCelebration,
            child: Center(
              child: Lottie.asset(
                'assets/mini_app_directory/tictactoe/celebration_animation.json', // Replace with your animation file path
                // Set the height
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRow(int x) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: Utils.modelBuilder(
        matrix[x],
        (y, value) => buildField(x, y),
      ),
    );
  }

  Color getPlayerColor(String player) {
    if (player == p.X) {
      return const Color(0xff0f5d22);
    } else if (player == p.O)
      // ignore: curly_braces_in_flow_control_structures
      return const Color(0xffa95501);
    else {
      return Colors.white;
    }
  }

  Widget buildField(int x, int y) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(92, 92),
          backgroundColor: getPlayerColor(matrix[x][y]),
        ),
        onPressed: () {
          setField(matrix[x][y], x, y);
        },
        child: Text(
          matrix[x][y],
          style: const TextStyle(fontSize: 42),
        ),
      ),
    );
  }

  Future<void> _startCelebrationAnimation() async {
    setState(() {
      showCelebration = true;
    });

    await Future.delayed(const Duration(seconds: 4)); // Wait for 8 seconds

    setState(() {
      showCelebration = false; // Hide the animation after 8 seconds
    });
  }

  void setField(String value, int x, int y) {
    if (value == p.noPlayer) {
      final nextPlayer = lastMove == p.X ? p.O : p.X;
      setState(() {
        matrix[x][y] = nextPlayer!;
        lastMove = nextPlayer;
      });
    }
    if (isWinner(x, y)) {
      debugPrint("Player $lastMove has won");
      setState(() {
        if (lastMove == p.X) {
          playerXScore++;
        } else {
          playerOScore++;
        }
      });
      _startCelebrationAnimation(); // Start the celebration animation
      showEndDialog("Player $lastMove has won");
    } else if (isDraw()) {
      debugPrint("Draw!");
      showEndDialog("Draw!");
    }
  }

  showEndDialog(String message) {
    setEmptyFields();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(message),
        content: const Text("Would you like to play again or reset the score?"),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                playerXScore = 0;
                playerOScore = 0;
              });
              Navigator.of(context).pop();
            },
            child: const Text("Play Again"),
          ),
        ],
      ),
    );
  }

  bool isDraw() {
    return matrix.every((row) => row.every((element) => element != p.noPlayer));
  }

  bool isWinner(int x, int y) {
    final int n = matrixSize;
    final String player = matrix[x][y];

    int row = 0, col = 0, diag = 0, antiDiag = 0;

    for (int i = 0; i < n; i++) {
      if (matrix[x][i] == player) row++;
      if (matrix[i][y] == player) col++;
      if (matrix[i][i] == player) diag++;
      if (matrix[i][n - i - 1] == player) antiDiag++;
    }
    return row == n || col == n || diag == n || antiDiag == n;
  }
}
