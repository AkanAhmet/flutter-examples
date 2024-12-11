import 'package:flutter/material.dart';
import 'package:todoapp2/constants/task_type.dart';
import 'models/todo.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.todo});

  final Todo todo;

  @override
  State createState() => _TodoItem();
}

class _TodoItem extends State<TodoItem> {
  bool isChecked = false;

  @override
  Widget build(context) {
    return Card(
      color:  widget.todo.completed! ?  Colors.grey : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /*
            widget.todo.type == TaskType.note ? Image.asset("lib/assets/images/category_1.png")
            : widget.todo.type == TaskType.calendar ? Image.asset("lib/assets/images/category_2.png")
            : Image.asset("lib/assets/images/category_3.png")
            */
            Image.asset("lib/assets/images/category_1.png")  //TODO REMOVE WHEN FIREBASE
            ,
            Column(children: [
              Text(widget.todo.todo!,
                  style: TextStyle(
                    decoration:
                    widget.todo.completed! ? TextDecoration.lineThrough : TextDecoration.none,
                      fontWeight: FontWeight.bold, fontSize: 21)),
              Text("User : ${widget.todo.userId!}",style: TextStyle( decoration:
                  widget.todo.completed! ? TextDecoration.lineThrough : TextDecoration.none
              ))
            ]),
            Checkbox(
                value: isChecked,
                onChanged: (val) {
                  setState(() {
                    widget.todo.completed = !widget.todo.completed!;
                    isChecked = val!;
                  });
                })
          ],
        ),
      ),
    );
  }
}
