import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rest_api/utils/models/comments_model.dart';
import 'package:rest_api/utils/services/api_service.dart';


class PostComment extends StatefulWidget {

  const PostComment({super.key});

  @override
  State createState() => _PostComment();
}

class _PostComment extends State<PostComment> {

  TextEditingController postIdController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    ApiService apiService = ApiService();

    void saveComment(CommentsModel model) async{

      final response = await apiService.saveComment(model);
      print(response.statusCode);

      if(response.statusCode == HttpStatus.accepted ) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Successfully posted !")));
      }
      else { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Failed to post !")));}
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              const Expanded(child: Text("postId : ")),
              Expanded(child: TextField(controller: postIdController),)
            ],
          ),
          Row(
            children: [
              const Expanded(child: Text("id : ")),
              Expanded(child: TextField(controller: idController),)
            ],
          ),
          Row(
            children: [
              const Expanded(child: Text("Name : ")),
              Expanded(child: TextField(controller: nameController),)
            ],
          ),
          Row(
            children: [
              const Expanded(child: Text("email : ")),
              Expanded(child: TextField(controller: emailController),)
            ],
          ),
          Row(
            children: [
              const Expanded(child: Text("body : ")),
              Expanded(child: TextField(controller: bodyController),)
            ],
          ),
          ElevatedButton(onPressed: () async{
            CommentsModel comment = CommentsModel(
              body: bodyController.text,
              name: nameController.text,
              email: emailController.text,
              postId: int.parse(postIdController.text),
              id:  int.parse(idController.text));
              saveComment(comment);
            Navigator.pop(context);
          }, child: const Text("Save Comment"))
        ],
      ),
    );
  }

}