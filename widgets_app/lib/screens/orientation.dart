import 'package:flutter/material.dart';

class OrientationScreen extends StatelessWidget {
  const OrientationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orientation Screen'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.portrait ? 3 : 4,
            ),
            itemBuilder: (context, index) {
              return Center(
                child: Text(
                  'A $index',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
            itemCount: 25,
          );
        },
      ),
    );
  }
}
