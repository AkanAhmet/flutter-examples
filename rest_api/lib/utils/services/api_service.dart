

import 'dart:convert';

import 'package:rest_api/utils/models/comments_model.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/utils/constants/api_constants.dart';


class ApiService {


  Future<List<CommentsModel>> getComments() async{
    final response = await http.get(Uri.parse(url));

    List<CommentsModel> result = List.empty(growable: true);
    List<dynamic> responseList = jsonDecode(response.body);
    responseList.forEach((item) {
      result.add(CommentsModel.fromJson(item));
    });
      return result;
  }

  Future<http.Response> saveComment  (CommentsModel model) async{

    final response = await http.post(Uri.parse(url),headers: <String,String>{'Content-Type':'application/json; charset=UTF-8'},
    body: jsonEncode(model.toJson()));

    return response;
  }


}