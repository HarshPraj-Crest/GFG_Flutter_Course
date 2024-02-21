import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  void _popup(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert Box'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('CANCEL'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('ACEEPT'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'This is popup button',
            style: GoogleFonts.amaranth(
              color: Colors.blueAccent,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 16),
          MaterialButton(
            elevation: 1,
            color: const Color.fromARGB(255, 213, 201, 232),
            onPressed: () {
              _popup(context); // Pass the context to _popup method
            },
            child: const Text('Popup'),
          ),
        ],
      ),
    );
  }
}
