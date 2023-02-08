import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FillTheBlanks extends StatefulWidget {
  const FillTheBlanks({Key? key}) : super(key: key);

  @override
  State<FillTheBlanks> createState() => _FillTheBlanksState();
}

class _FillTheBlanksState extends State<FillTheBlanks> {
  bool _isHeat = false;
  bool _isCoolDropped = false;
  bool _isZeroDropped = false;
  bool _isFreezDropped = false;
  bool _isHundredDropped = false;
  bool _isEvaporate = false;
  String _heat = 'heat';
  String _hundred = '100 c';
  String _evaporate = 'evaporate';
  String _cool = 'cool';
  String _zero = '0c';
  String _freez = 'freezes';

  TextStyle content = const TextStyle(
      color: Colors.blue,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      letterSpacing: 2.0);
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
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Stack(children: [
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'if you',
                    style: content,
                  ),
                  Positioned(
                      top: 0,
                      child: buildTarget(
                          text: _isHeat ? '$_heat' : "",
                          onAccept: (data) {
                            setState(() {
                              _isHeat = true;
                            });
                          })),
                  Text(
                    "water to a temperature of",
                    style: content,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //2nd question
              Row(
                children: [
                  Positioned(
                    child: buildTarget(
                        onAccept: (data) {
                          setState(() {
                            _isHundredDropped = true;
                          });
                        },
                        text: _isHundredDropped ? '$_hundred' : ''),
                  ),
                  Text(
                    ',it',
                    style: content,
                  ),
                  Positioned(
                    child: buildTarget(
                        onAccept: (data) {
                          setState(() {
                            _isEvaporate = true;
                          });
                        },
                        text: _isEvaporate ? '$_evaporate' : ''),
                  ),
                  Text(
                    'to form water vapour.',
                    style: content,
                  ),
                ],
              ),

              //3rd question
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'if you',
                    style: content,
                  ),
                  Positioned(
                      //top: 0,
                      // left: 0,
                      child: buildTarget(
                          text: _isCoolDropped ? '$_cool' : '',
                          onAccept: (data) {
                            setState(() {
                              _isCoolDropped = true;
                            });
                          })),
                  Text('water to a temperature of', style: content),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              //4th row

              Row(
                children: [
                  Positioned(
                    child: buildTarget(
                        onAccept: (data) {
                          setState(() {
                            _isZeroDropped = true;
                          });
                        },
                        text: _isZeroDropped ? '$_zero' : ''),
                  ),
                  Text(
                    ',it',
                    style: content,
                  ),
                  Positioned(
                    child: buildTarget(
                      onAccept: (data) {
                        setState(() {
                          _isFreezDropped = true;
                        });
                      },
                      text: _isFreezDropped ? '$_freez' : '',
                    ),
                  ),
                  Text(
                    'to form ice.',
                    style: content,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(children: [
                        Visibility(
                          visible: !_isHeat,
                          child: Draggable<String>(
                            data: _heat,
                            child: buildDrggableContainer(ansText: '$_heat'),
                            feedback: buildDrggableContainer(ansText: '$_heat'),
                            childWhenDragging: Container(),
                          ),
                        ),
                        Visibility(
                          visible: !_isHundredDropped,
                          child: Draggable<String>(
                            // Data is the value this Draggable stores.
                            data: _hundred,
                            child: buildDrggableContainer(ansText: '$_hundred'),

                            feedback:
                                buildDrggableContainer(ansText: '$_hundred'),
                            childWhenDragging: Container(),
                          ),
                        ),
                        Visibility(
                          visible: !_isEvaporate,
                          child: Draggable<String>(
                            // Data is the value this Draggable stores.
                            data: _heat,
                            child:
                                buildDrggableContainer(ansText: '$_evaporate'),

                            feedback:
                                buildDrggableContainer(ansText: '$_evaporate'),
                            childWhenDragging: Container(),
                          ),
                        ),
                        Visibility(
                          visible: !_isCoolDropped,
                          child: Draggable<String>(
                            // Data is the value this Draggable stores.
                            data: _cool,
                            child: buildDrggableContainer(ansText: '$_cool'),

                            feedback: buildDrggableContainer(ansText: '$_cool'),
                            childWhenDragging: Container(),
                          ),
                        ),
                      ]),
                      Row(
                        children: [
                          Visibility(
                            visible: !_isZeroDropped,
                            child: Draggable<String>(
                              // Data is the value this Draggable stores.
                              data: _zero,
                              child: buildDrggableContainer(ansText: '$_zero'),
                              feedback:
                                  buildDrggableContainer(ansText: '$_zero'),
                              childWhenDragging: Container(),
                            ),
                          ),
                          Visibility(
                            visible: !_isFreezDropped,
                            child: Draggable<String>(
                              data: _freez,
                              child: buildDrggableContainer(
                                ansText: '$_freez',
                              ),
                              feedback: buildDrggableContainer(
                                ansText: '$_freez',
                              ),
                              childWhenDragging: Container(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }

  Card buildDrggableContainer({
    required String ansText,
  }) {
    return Card(
      elevation: 10,
      color: Colors.blue[200],
      child: SizedBox(
        width: 100,
        height: 35,
        child: Center(
          child: Text(
            ansText,
            style: content,
          ),
        ),
      ),
    );
  }

  DragTarget<String> buildTarget({
    required String text,
    required DragTargetAccept<String> onAccept,
    bool? colorChange,
  }) {
    return DragTarget<String>(
      builder: (
        BuildContext context,
        List<dynamic> accepted,
        List<dynamic> rejected,
      ) {
        return Container(
          height: 35,
          width: 120,
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.black),
          )),
          child: Center(
            child: Text(text, style: content),
          ),
        );
      },
      onWillAccept: (data) => true,
      onAccept: (data) {
        onAccept(data);
      },
    );
  }
}
