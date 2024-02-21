import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataListScreen extends StatelessWidget {
  const DataListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stored data'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('data').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Center(
            child: ListView(
              children: snapshot.data!.docs.map(
                (document) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(document['text']),
                  );
                },
              ).toList(),
            ),
          );
        },
      ),
    );
  }
}
