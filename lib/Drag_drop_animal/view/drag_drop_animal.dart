import 'package:fill_in_blanks/Drag_drop_animal/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FillTheBlanksAnimal extends StatefulWidget {
  const FillTheBlanksAnimal({Key? key}) : super(key: key);

  @override
  State<FillTheBlanksAnimal> createState() => _FillTheBlanksStateAnimal();
}

class _FillTheBlanksStateAnimal extends State<FillTheBlanksAnimal> {
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        Row(
          children: [
            Column(
              children: [
                Text(
                  "Animal",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: Colors.black),
                ),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade100, width: 2),
                  ),
                  child: DragTarget<Animal>(
                      builder: (context, candidateData, rejectedData) =>
                          GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 3,
                            ),
                            primary: false,
                            shrinkWrap: true,
                            itemCount: allAnimals.length,
                            itemBuilder: (context, index) => Container(
                              color: Colors.blue,
                              height: 200,
                              width: 250,
                            ),
                          )),
                )
              ],
            )
          ],
        )
      ])),
    );
  }
}
