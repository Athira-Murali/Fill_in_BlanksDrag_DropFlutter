import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<String> answers = ['apple', 'banana', 'cherry'];
  Map<String, int> answerPositions = {'apple': 0, 'banana': 1, 'cherry': 2};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fill in the Blanks Quiz'),
      ),
      body: Container(
        child: Column(
          children: [
            Text('What is the name of the fruit in the basket?'),
            Container(
              height: 150,
              child: DragTarget<String>(
                builder: (context, List<String?> incoming, rejected) {
                  if (incoming.isNotEmpty) {
                    return Container(
                      color: Colors.green,
                      child: Text(incoming[0]!),
                    );
                  } else {
                    return Container(
                      color: Colors.grey,
                      child: Text('Drop here'),
                    );
                  }
                },
                onWillAccept: (data) => true,
                onAccept: (data) {
                  int correctIndex = answerPositions[data]!;
                  int selectedIndex = answers.indexOf(data);
                  if (correctIndex == selectedIndex) {
                    // correct answer
                  } else {
                    // incorrect answer
                  }
                },
              ),
            ),
            Expanded(
              child: ListView(
                children: answers
                    .map((answer) => Draggable<String>(
                          data: answer,
                          child: Container(
                            color: Colors.yellow,
                            child: Text(answer),
                          ),
                          feedback: Container(
                            color: Colors.yellow,
                            child: Text(answer),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
