import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todoapp2/constants/colors.dart';
import 'package:todoapp2/constants/task_type.dart';
import 'package:todoapp2/screens/category_selector.dart';
import 'package:todoapp2/service/todo_service.dart';

import '../models/task.dart';
import '../models/todo.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key, required this.addNewTask});

  @override
  State createState() => _AddNewTask();

  final void Function(Task newTask ) addNewTask;

}

class _AddNewTask extends State<AddNewTask> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  TodoService todoService = TodoService();
  TaskType type = TaskType.note;

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
    return SafeArea(
        child: Scaffold(
            backgroundColor: HexColor(bgColor),
            body: SingleChildScrollView(
              child:
              Column(
                children: [
                  //HEADER

                  Container(
                    width: deviceWidth,
                    height: deviceHeight / 10,
                    decoration: const BoxDecoration(
                      color: Colors.purple,
                      image: DecorationImage(
                          image:
                          AssetImage(
                              ("lib/assets/images/add_new_task_header.png")),
                          fit: BoxFit.cover),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.close,
                              size: 40,
                              color: Colors.white,
                            )),
                        const Expanded(
                            child: Text(
                              "Add new Task",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21),
                            ))
                      ],
                    ),
                  ),

                  // MIDDLE
                  const Padding(padding: EdgeInsets.only(top: 20),
                      child: Text("Task Title")),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    child: TextField(
                      controller: titleController,
                      decoration:
                      const InputDecoration(
                          filled: true, fillColor: Colors.white),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(top: 10), child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("Category"),
                      GestureDetector( //TODO CategorySelector widgetina state geçirilecek !!!
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    duration: Duration(milliseconds: 300),
                                    content: Text("Category Selected"))
                            );
                            type = TaskType.note;
                          },
                          child: Image.asset("lib/assets/images/category_1.png")
                      ),
                      GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    duration: Duration(milliseconds: 300),
                                    content: Text("Category Selected"))
                            );
                            type = TaskType.calendar;
                          },
                          child: Image.asset("lib/assets/images/category_2.png")
                      ),
                      GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    duration: Duration(milliseconds: 300),
                                    content: Text("Category Selected"))
                            );
                            type = TaskType.context;
                          },
                          child: Image.asset("lib/assets/images/category_3.png")
                      )
                    ],
                  )),
                  Padding(padding: const EdgeInsets.only(top: 20), child: Row(
                    children: [
                      Expanded(
                          child: Column(
                            children: [
                              const Text("User"),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: TextField(
                                    controller: userController,
                                    decoration: const InputDecoration(
                                        filled: true, fillColor: Colors.white),
                                  ))
                            ],
                          )),
                      Expanded(
                          child: Column(children: [
                            const Text("Time"),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20),
                                child: TextField(
                                  controller: timeController,
                                  decoration: const InputDecoration(
                                      filled: true, fillColor: Colors.white),
                                ))
                          ]))
                    ],
                  )),
                  //BOTTOM

                  const Padding(padding: EdgeInsets.only(top: 30),
                      child: Text("Description")),
                  SizedBox(
                      height: 400,
                      child: TextField(controller: descriptionController,
                          maxLines: null,
                          expands: true,
                          decoration: const InputDecoration(
                              filled: true, fillColor: Colors.white))
                  ),
                  Padding(padding: const EdgeInsets.only(top: 20,bottom: 20),
                      child: ElevatedButton(onPressed: () {
                        String titleText = titleController.text;
                        String descriptionText = descriptionController.text;
                        if (warnForFill(titleText,"title") && warnForFill(descriptionText,"description") ) {
                        Task newTask = Task(type: type, title: titleController.text, description: descriptionController.text, isCompleted: false);
                        widget.addNewTask(newTask);
                        saveTodo();
                        Navigator.of(context).pop();
                        }
                        }, child: const Text("Save")))
                ],
              ),
            )
        ));
  }

  bool warnForFill(String text,String field) {
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              duration: const Duration(milliseconds: 500),
              content: Text("$field can't be blank !"))
      );

      return false;
    }
    return true;
  }

  void saveTodo() {

    Todo todo = Todo(id: -1, todo: titleController.text, completed: false, userId: int.parse(userController.text));
    todoService.saveTodo(todo);

  }
}
