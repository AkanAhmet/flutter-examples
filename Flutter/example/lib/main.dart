import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:example/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const RowTest());
}

class WidgetDetail extends StatefulWidget {
  const WidgetDetail({super.key});

  @override
  State<StatefulWidget> createState() => _WidgetDetail();
}

class _WidgetDetail extends State<WidgetDetail> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Akan",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red, fontFamily: "Ahmet"),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Ahmet"),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          leading: const Text("Menu"),
          //actions: [],
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(value.toString()),
          Text(
            "Data",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              letterSpacing: 10,
              color: HexColor(secondaryColor),
              backgroundColor: HexColor(primaryColor),
              fontFamily: "Ahmet",
            ),
          ),
          (Text("Data 2", style: GoogleFonts.dancingScript(fontSize: 40))),
          Image(image: AssetImage("lib/assets/images/img2.jpg")),
          Image(
              image: NetworkImage(
                  "https://images.pexels.com/photos/208984/pexels-photo-208984.jpeg")),
          Image.asset("lib/assets/images/img1.jpg"),
          Image.network(
              "https://images.pexels.com/photos/69932/tabby-cat-close-up-portrait-69932.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
        ])),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              value++;
            });
          },
          child: const Text("+"),
        ),
      ),
    );
  }
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value.toString()),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  value++;
                });
              },
              child: const Text("Click"))
        ],
      ),
    )));
  }
}

class ContainerTest extends StatelessWidget {
  const ContainerTest({super.key});

  Widget build(context) {
    return MaterialApp(
        title: "container",
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(5, 4, 3, 2),
              margin: EdgeInsets.all(50),
              color: Colors.red,
              child: Text("hello world"),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text("data"),
            )
          ],
        )));
  }
}

class RowTest extends StatelessWidget {
  const RowTest({super.key});

  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "RowExample",
      home: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("data1"),
            Text("data2"),
            ElevatedButton(onPressed: () {}, child: const Text("Click")),
            Container(
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.fromLTRB(25, 25, 5, 5),
              color: Colors.blue,
              child: Text("data"),
            )
          ],
        ),
      ),
    );
  }
} 
 