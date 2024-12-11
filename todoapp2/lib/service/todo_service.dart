import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/todo.dart';

class TodoService {

  final String url = "https://dummyjson.com/todos";
  final String addUrl = "https://dummyjson.com/todos/add";

  Future<List<Todo>> getUncompletedTodos() async {

    final response = await http.get(Uri.parse(url));
    List<dynamic> resp = jsonDecode(response.body)["todos"];

    List<Todo> todos = List.empty(growable: true);

    resp.forEach((element) {
      Todo todo = Todo.fromJson(element);
      if(!todo.completed!) {
        todos.add(todo);
      }
    });
    return todos;

  }

  Future<List<Todo>> getCompletedTodos() async {

    final response = await http.get(Uri.parse(url));
    List<dynamic> resp = jsonDecode(response.body)["todos"];

    List<Todo> todos = List.empty(growable: true);

    resp.forEach((element) {
      Todo todo = Todo.fromJson(element);
      if(todo.completed!) {
        todos.add(todo);
      }
    });
    return todos;

  }

Future<String> saveTodo(Todo todo) async{

    final response = await http.post(Uri.parse(addUrl),
        headers: <String,String>{"Content-Type":"application/json; charset=UTF-8"},
        body: json.encode(todo.toJson()));

    print(response.body);
    return response.body;

  }
}