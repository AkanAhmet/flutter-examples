
import 'package:todoapp2/constants/task_type.dart';

class Task {

  Task({
    required this.type,
    required this.title,
    required this.description,
    required this.isCompleted
});

  final TaskType type;
  String title;
  String description;
  bool isCompleted;
}