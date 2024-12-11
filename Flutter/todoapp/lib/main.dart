import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todoapp/constants/colors.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State createState() => _Myapp();
}

class _Myapp extends State<Myapp> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    double deviceHeight = MediaQuery
        .of(context)
        .size
        .height;

    DateTime now = DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    String formattedDate = date.toString().replaceAll("00:00:00.000", "");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todo App",
      home: SafeArea(
          child: Scaffold(
            backgroundColor: HexColor(bgColor),
            body: Column(children: [
              //Header
              Container(
                decoration: const BoxDecoration(
                  color: Colors.purple,
                  image: DecorationImage(
                      image: AssetImage("lib/assets/images/header.png"),
                      fit: BoxFit.cover),
                ),
                width: deviceWidth,
                height: deviceHeight / 3,
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Text(formattedDate.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ))),
                    const Padding(
                        padding: EdgeInsets.only(top: 35),
                        child: Text("Todo List",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold)))
                  ],
                ),
              ),
              //Top Column
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Icon(
                                              Icons.notes_outlined, size: 40),
                                          const Text(
                                            "Study Lessons",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 21),
                                          ),
                                          Checkbox(
                                              value: isChecked,
                                              onChanged: (val) {
                                                setState(() {
                                                  isChecked = val!;
                                                });
                                              })
                                        ],
                                      ))),

                            ],
                          )))),
              // Completed Text
              const Padding (padding: EdgeInsets.only(left: 20.0), child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Completed",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)
                  )
              )
              ),
              // Bottom Column
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Icon(
                                              Icons.notes_outlined, size: 40),
                                          const Text(
                                            "Study Lessons",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 21),
                                          ),
                                          Checkbox(
                                              value: isChecked,
                                              onChanged: (val) {
                                                setState(() {
                                                  isChecked = val!;
                                                });
                                              })
                                        ],
                                      )))

                            ],
                          )))),
              ElevatedButton(
                onPressed: (){},child: const Text("Add new Task"),
              )
            ]),
          )),
    );
  }
}
