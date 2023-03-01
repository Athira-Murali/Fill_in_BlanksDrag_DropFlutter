import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DragandDrop extends StatefulWidget {
  const DragandDrop({Key? key}) : super(key: key);

  @override
  State<DragandDrop> createState() => _DragandDropState();
}

class _DragandDropState extends State<DragandDrop> {
  final Map<String, bool> score = {};
  // List<String> _blankWords = ["___1___", "___2___", "___3___"];
  final Map choices = {
    'heat': 'If you ___1___ water to a temperature of',
    'cool': 'if you ___2___ water to a temperature of',
  };
  final Map answer = {
    'heat': 'If you heat water to a temperature of',
    'cool': 'if you cool water to a temperature of',
  };
  int refresh = 0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            Row(
                children: choices.keys.map((words) {
              return Draggable<String>(
                  data: words,
                  child:
                      WordDraggable(word: score[words] == true ? '✅' : words),
                  feedback: WordDraggable(word: words),
                  childWhenDragging: const WordDraggable(word: '🌱'));
            }).toList()),
            const SizedBox(height: 20),
            SingleChildScrollView(
              child: Column(
                  children: choices.keys
                      .map((words) => _buildDragTarget(words))
                      .toList()
                    ..shuffle(Random(refresh))),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            score.clear();
            refresh++;
          });
        },
      ),
    );
  }

  Widget _buildDragTarget(words) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String?> incoming, List rejected) {
        if (score[words] == true) {
          return Text("${choices[words]} + $words");
          // return Text(
          //   'If you $words water to a temperature of',
          //   style: TextStyle(fontSize: 18),
          // );
        } else {
          return SizedBox(
              height: 25,
              child: Text(
                choices[words],
                style: const TextStyle(fontSize: 18),
              ));
        }
      },
      onWillAccept: (data) => data == words,
      onAccept: (data) {
        setState(() {
          score[words] = true;
        });
      },
      onLeave: (data) {},
    );
  }
}

class WordDraggable extends StatelessWidget {
  const WordDraggable({Key? key, required this.word}) : super(key: key);
  final String word;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.blue[200],
      child: SizedBox(
        width: 100,
        height: 35,
        child: Center(
          child: Text(
            word,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
