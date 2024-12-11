import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todoapp2/constants/colors.dart';
import 'package:todoapp2/constants/task_type.dart';
import 'package:todoapp2/models/task.dart';
import 'package:todoapp2/screens/add_new_task.dart';
import 'package:todoapp2/service/todo_service.dart';
import 'package:todoapp2/todoitem.dart';


/*
List<Task> todo = [
  Task(type: TaskType.note, title: "Study Lesson", description: "Study comppspf", isCompleted: false),
  Task(type: TaskType.context, title: "Run 5K", description: "Run 5K near the river", isCompleted: false),
  Task(type: TaskType.calendar, title: "Go to party", description: "Go to party wednesday", isCompleted: false),
];
*/

List<Task> todo = [] ;

/*
List<Task> done = [
  Task(type: TaskType.context, title: "Go work", description: "Go work gagaga", isCompleted: false),
  Task(type: TaskType.calendar , title: "Watch the snow", description: "Watch the snow", isCompleted: false),
  Task(type: TaskType.note, title: "Buy computer", description: "Buy computer fsfs", isCompleted: false),
];
*/
List<Task> done = [];

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State createState() => _HomeScreenState();

}


class _HomeScreenState extends State<HomeScreen> {

  void addNewTask(Task newTask) {
    setState((){
      todo.add(newTask); });
  }

  @override
  Widget build(BuildContext context){

    TodoService todoService = TodoService();

    double deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    double deviceHeight = MediaQuery
        .of(context)
        .size
        .height;

    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    String formattedDate = date.toString().replaceAll("00:00:00.000", "");


    return   SafeArea( // Yukarı kısmı kaplamasını engeller
          child: Scaffold(
              backgroundColor: HexColor(bgColor),
              body:
              // SCREEN
              Column(
                children: [
                  // HEADER
                  Container(
                    width: deviceWidth,
                    height: deviceHeight / 3,
                    decoration: const BoxDecoration(
                      color: Colors.purple,
                      image: DecorationImage(
                          image: AssetImage("lib/assets/images/header.png"),
                          fit: BoxFit.cover),
                    ),

                    // HEADER TEXT
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Text(
                            formattedDate,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        // TODO APP TEXT
                        const Padding(
                          padding: EdgeInsets.only(top: 35),
                          child: Text("TODO LIST", style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),

                  // TOP COLUMN
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: SingleChildScrollView(
                          child: FutureBuilder(
                              future : todoService.getUncompletedTodos(),
                              builder: (context, snapshot) {
                              if(snapshot.data == null) {
                                return const CircularProgressIndicator();
                              }
                              else {
                                return ListView.builder(
                                    primary: false,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      return TodoItem(todo: snapshot.data![index],);

                                    });
                              }
                          })

                      ),

                    ),
                  ),
                  // Completed Text
                  const Padding (padding: EdgeInsets.only(left: 20.0,top: 15.0), child: Align(
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
                              child: FutureBuilder(
                                future: todoService.getCompletedTodos(),
                                builder: (context, snapshot) {
                                  if(snapshot.data == null) {
                                    return const CircularProgressIndicator();
                                  }
                                  else {
                                    return ListView.builder(
                                        primary: false,
                                        shrinkWrap: true,
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                          return TodoItem(
                                              todo: snapshot.data![index]);
                                        });
                                  }
                              },)

                          ))),
                  Padding(padding: const EdgeInsets.only(bottom: 20),
                      child: ElevatedButton(
                        onPressed: (){  //TODO FUNCTION AS PARAMETER
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddNewTask(addNewTask:
                          (newTask) => addNewTask(newTask)),));
                        },child: const Text("Add new Task"),
                      ))
                ],
              )
          )
    );

  }

}