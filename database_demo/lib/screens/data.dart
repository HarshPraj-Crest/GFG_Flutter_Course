import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:database_demo/screens/data_list.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  Future<void> _addDataAndNavigate(BuildContext context) async {
    try {
      // Add data to Firestore
      await FirebaseFirestore.instance.collection('data').add(
        {'text': 'Data added through app'},
      );

      // After successful addition, navigate to DataListScreen
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const DataListScreen();
          },
        ),
      );
    } catch (error) {
      // Handle any errors that occur during data addition
      print('Error adding data to Firestore: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database data'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton.icon(
                onPressed: () {
                  _addDataAndNavigate(context);
                } ,
                label: const Text('Add Data'),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
