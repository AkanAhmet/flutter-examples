import 'package:flutter/material.dart';
import 'package:todoapp2/screens/add_new_task.dart';

import '../constants/task_type.dart';

//TODO UNUSED !!!!!


class CategorySelector extends StatelessWidget {
  final String img;


  const CategorySelector({super.key, required this.img});


  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: (){
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  duration: Duration(milliseconds: 300),
                  content: Text("Category Selected"))
          );
        },
        child: Image.asset(img)
      )
   ;
  }
}
