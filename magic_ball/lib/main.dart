import 'package:flutter/material.dart';
import 'dart:math';
 
// Creates a Material App
void main() => runApp(
      const MaterialApp(
        home: BallPage(),
      ),
    );
 
// Creates a Scaffold with
// appbar using Stateless widget 
class BallPage extends StatelessWidget {
  const BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: const Text('GeeksforGeeks'),
      ),
      body: const Ball(),
    );
  }
}
 
// Creates a Stateful widget 
class Ball extends StatefulWidget {
  const Ball({super.key});
 
  @override
  State<Ball> createState() => _BallState();
}
 
class _BallState extends State<Ball> {
  int ballNumber = 1;
   
  @override
   
  // Returns app with centered image Flatbutton  
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: () {
          setState(() {
             
            // Random.nextInt(n) returns random
            // integer from 0 to n-1
            ballNumber = Random().nextInt(5) + 1;
          });
        },
         
        // Adding images
        child: Image.asset('assets/images/ball$ballNumber.png'),
      ),
    );
  }
}