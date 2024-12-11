import 'package:flutter/material.dart';
import 'package:rest_api/post_comment.dart';
import 'package:rest_api/utils/services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
              child: FutureBuilder(
                future: apiService.getComments(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Stack(
                      children: [
                    ListView.builder(
                    itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Text(
                          snapshot.data![index].body.toString(),
                          style: const TextStyle(color: Colors.white),
                        );
                      },
                    ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child:
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const PostComment(),
                                  ),
                                );
                              },
                              child: const Text("Post Comment"),
                            ),

                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text("${snapshot.error}"));
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),



        ),
      ),
    );
  }
}

