import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:widgets_app/models/album.dart';

import 'package:http/http.dart' as http;

Future<Album> createAlbum(String title) async {
  if (title.isEmpty) {
    throw Exception('Title cannot be null');
  }

  final url = Uri.parse('https://jsonplaceholder.typicode.com/albums');
  final http.Response response = await http.post(
    url,
    body: jsonEncode(
      <String, String>{
        'title': title,
      },
    ),
  );

  if (response.statusCode == 201) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class IntDataScreen extends StatefulWidget {
  const IntDataScreen({super.key});

  @override
  State<IntDataScreen> createState() {
    return _IntDataScreenState();
  }
}

class _IntDataScreenState extends State<IntDataScreen> {
  final TextEditingController _controller = TextEditingController();
  late Future<Album?> _futureAlbum;

  @override
  void initState() {
    _futureAlbum = Future<Album?>.value();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP Data'),
      ),
      body: FutureBuilder<Album?>(
        future: _futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            return Center(
              child: Text(snapshot.data!.title),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(hintText: 'Enter Title'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      setState(() {
                        _futureAlbum = createAlbum(_controller.text);
                      });
                    } else {
                      // Handle the case where title is empty
                      // For example, show a snackbar or display an error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a title.'),
                        ),
                      );
                    }
                  },
                  child: const Text('Create Data'),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
