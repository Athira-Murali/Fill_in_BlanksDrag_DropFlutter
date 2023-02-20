import 'package:fill_in_blanks/DragDrop_rich/data/data.dart';
import 'package:flutter/material.dart';

class DragDropView extends StatelessWidget {
  DragDropView({Key? key}) : super(key: key);
  final Map<String, bool> score = {};

  final Map choices = {
    'heat': 'If you ___1___ water to a temperature of',
    'cool': 'if you ___2___ water to a temperature of',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
                children: choices.keys.map((words) {
              return Draggable<String>(
                  data: words,
                  child:
                      WordDraggable(word: score[words] == true ? '✅' : words),
                  feedback: WordDraggable(word: words),
                  childWhenDragging: const WordDraggable(word: '🌱'));
            }).toList()),
          ),
          Expanded(child: QuestionView())
        ],
      )),
    );
  }
}

class QuestionView extends StatelessWidget {
  const QuestionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return RichText(
              text: TextSpan(text: "", children: <TextSpan>[
            TextSpan(
                text: DraggableItem().draggableitem[index].firstpart,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.black)),
            TextSpan(
                text: DraggableItem().draggableitem[index].answer,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.black)),
            TextSpan(
                text: DraggableItem().draggableitem[index].lastpart,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.black)),
          ]));
        });
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
