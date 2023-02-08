import 'package:flutter/material.dart';

class FillInTheBlanks2 extends StatefulWidget {
  @override
  _FillInTheBlanksState createState() => _FillInTheBlanksState();
}

class _FillInTheBlanksState extends State<FillInTheBlanks2> {
  final _formKey = GlobalKey<FormState>();
  List<String> _sentences = [
    "The sky is _____.",
    "The sun is _____.",
  ];
  List<String> _answers = [
    "blue",
    "yellow",
  ];
  List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _sentences.length; i++) {
      _controllers.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              for (int i = 0; i < _sentences.length; i++)
                TextFormField(
                  controller: _controllers[i],
                  decoration: InputDecoration(
                    labelText: _sentences[i],
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter an answer.";
                    }
                    if (value != _answers[i]) {
                      return "Incorrect answer.";
                    }
                    return null;
                  },
                ),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("Correct!");
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
