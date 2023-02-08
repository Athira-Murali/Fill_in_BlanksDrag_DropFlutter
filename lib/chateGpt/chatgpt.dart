import 'package:flutter/material.dart';

class FillTheBlanks1 extends StatefulWidget {
  @override
  _FillTheBlanksState createState() => _FillTheBlanksState();
}

class _FillTheBlanksState extends State<FillTheBlanks1> {
  List<String> _blankWords = ["___1___", "___2___", "___3___"];
  List<String> _answers = ["flutter", "widgets", "app"];
  String _sentence = "I am building an ___1___ app using ___2___ and ___3___.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fill the Blanks"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                _sentence,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: _blankWords.map((blank) {
                return TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: blank,
                  ),
                  onChanged: (text) {
                    setState(() {
                      int index = _blankWords.indexOf(blank);
                      _answers[index] = text;
                      _sentence = _sentence.replaceAll(blank, text);
                    });
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
