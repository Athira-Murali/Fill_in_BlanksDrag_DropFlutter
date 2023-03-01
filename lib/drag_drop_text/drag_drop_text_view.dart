import 'package:fill_in_blanks/drag_drop_text/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextDragandDrop extends StatefulWidget {
  const TextDragandDrop({Key? key}) : super(key: key);

  @override
  State<TextDragandDrop> createState() => _TextDragandDropState();
}

class _TextDragandDropState extends State<TextDragandDrop> {
  final List<Climate> all = allClimate;
  final List<Climate> summer = [];
  final List<Climate> winter = [];

  final List<Climate> climates = [];

  bool _isDropped = false;

  int count = 0;

  void removeAll(Climate toRemove) {
    all.removeWhere((climate) => climate.name == toRemove.name);
    summer.removeWhere((climate) => climate.name == toRemove.name);
    winter.removeWhere((climate) => climate.name == toRemove.name);
  }

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
    //print(count);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    "Summer",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color: Colors.black),
                  ),
                  buildTarget(
                    context,
                    climates: summer,
                    acceptTypes: [ClimateType.summer],
                    onAccept: (data) => setState(() {
                      removeAll(data);
                      summer.add(data);
                    }),
                  ),
                ],
              ),
              const SizedBox(
                width: 2,
              ),
              Column(
                children: [
                  Text(
                    "winter",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color: Colors.black),
                  ),
                  buildTarget(
                    context,
                    climates: winter,
                    acceptTypes: [ClimateType.winter],
                    onAccept: (data) => setState(() {
                      removeAll(data);
                      winter.add(data);
                      print(data.type);
                    }),
                  ),
                ],
              ),
              const SizedBox(
                width: 2,
              ),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 35),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 2,
                              crossAxisSpacing: 1,
                              childAspectRatio: 2.1),
                      itemCount: allClimate.length,
                      itemBuilder: (context, index) {
                        return ClimateDraggableWidgets(
                          climate: allClimate[index],
                        );
                      },
                    ),
                  )),
              Align(
                alignment: Alignment.bottomRight,
                child: buildButton(context, acceptTypes: ClimateType.values),
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildButton(
    BuildContext context, {
    required List<ClimateType> acceptTypes,
    // required Climate data,
  }) {
    return GestureDetector(
        onTap: () {
          var one = false;
          var two = false;
          print("...............summer...........${summer.toString()}");
          print("...............winter...........${winter.toString()}");

          for (int i = 0; i < summer.length; i++) {
            if (summer[i].type == ClimateType.summer) {
              one = true;
            } else {
              one = false;
            }
          }
          for (int i = 0; i < winter.length; i++) {
            if (winter[i].type == ClimateType.winter) {
              two = true;
            } else {
              two = false;
            }
          }
          if (one && two && (all.isEmpty)) {
            debugPrint("sucess");
          } else if (all.isNotEmpty) {
            debugPrint('incomplete');
          } else {
            debugPrint("failure");
          }
          // if (summer.contains(ClimateType.summer)) {
          //   debugPrint("correct data");
          // } else {
          //   debugPrint("Wrong data");
          // }

          // if (acceptTypes.contains(Climate().type)) {
          //   debugPrint("*************Correct************");
          // } else {
          //   debugPrint("#### Wrong data#####");
          // }

          //**********count************

          // if (summer.length == 4 &&
          //     winter.length == 4 &&
          //     count >= 8 &&
          //     all.isEmpty) {
          //   print("success");
          // } else if (all.isNotEmpty) {
          //   print('incomplete');
          // } else {
          //   print("failure");
          // }

          // if (all.isEmpty) {
          //   print("completed");
          // } else {
          //   print("incomplete");
          // }
          // if (count == 8) {
          //   print("success");
          // } else {
          //   print("failure");
          // }
          // if (acceptTypes.contains(climates!.type)) {
          //   debugPrint("-----------this  correct");
          // } else {
          //   debugPrint("-------------- false--------");
          // }
        },
        child: Image.asset(
          "assets/icons/done.png",
          height: 45,
          width: 45,
        ));
  }

  Widget buildTarget(
    BuildContext context, {
    required List<Climate> climates,
    required List<ClimateType> acceptTypes,
    required DragTargetAccept<Climate> onAccept,
  }) {
    return Container(
      color: const Color.fromARGB(255, 238, 220, 166),
      height: 250,
      width: 200,
      child: DragTarget<Climate>(
        builder: (context, candidateData, rejectedData) => GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: acceptTypes == ClimateType.values ? 3 : 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 1,
                childAspectRatio: 2.1),
            children: [
              ...climates
                  .map(
                    (climate) => ClimateDraggableWidgets(climate: climate),
                  )
                  .toList()
            ]),
        onWillAccept: (data) => true,
        onAccept: (data) {
          if (acceptTypes.contains(data.type)) {
            debugPrint("correct");
            setState(() {
              _isDropped = true;
              count++;
            });
          } else {
            debugPrint("wrong");
          }
          onAccept(data);
        },
        onLeave: (data) {
          print('Missed');
        },
      ),
    );
  }
}

class ClimateDraggableWidgets extends StatefulWidget {
  final Climate climate;

  const ClimateDraggableWidgets({
    Key? key,
    required this.climate,
  }) : super(key: key);

  @override
  State<ClimateDraggableWidgets> createState() =>
      _ClimateDraggableWidgetsState();
}

class _ClimateDraggableWidgetsState extends State<ClimateDraggableWidgets> {
  bool _isDropped = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Draggable<Climate>(
        data: widget.climate,
        feedback: buildText(context),
        childWhenDragging: Container(height: 20),
        onDragStarted: () {
          setState(() {
            _isDropped = true;
          });
        },
        onDragCompleted: () {
          setState(() {
            _isDropped = false;
          });
        },
        onDragEnd: (details) {
          setState(() {
            _isDropped = false;
          });
        },
        child: buildText(context),
      ),
    );
  }

  Widget buildText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue.shade200,
        ),
        child: Center(
            child: Text(widget.climate.name!,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.black))),
      ),
    );
  }
}
