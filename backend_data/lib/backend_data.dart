import 'dart:convert';

import 'package:backend_data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BackendData extends StatefulWidget {
  const BackendData({super.key});

  @override
  State<BackendData> createState() {
    return _BackendDataState();
  }
}

class _BackendDataState extends State<BackendData> {
  Future<List<User>> getRequest() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    List<User> users = [];
    for (var singleUser in responseData) {
      User user = User(
        id: singleUser["id"],
        userId: singleUser["userId"],
        title: singleUser["title"],
        body: singleUser["body"],
      );

      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Http get Request'),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: FutureBuilder(
            future: getRequest(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (ctx, index) => ListTile(
                    title: Text(snapshot.data![index].title),
                    subtitle: Text(snapshot.data![index].body),
                    contentPadding: const EdgeInsets.only(bottom: 20),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
