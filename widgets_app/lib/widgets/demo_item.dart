import 'package:flutter/material.dart';

class DemoItem extends StatelessWidget {
  const DemoItem(this.position, {super.key});

  final int position;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  color: Colors.deepOrange,
                  height: 40.0,
                  width: 40.0,
                ),
                const SizedBox(width: 8.0),
                Text("Item $position"),
              ],
            ),
            const Text("GeeksforGeeks.org was created with a goal "
                "in mind to provide well written, well "
                "thought and well explained solutions for selected"
                " questions. The core team of five super geeks"
                " constituting of technology lovers and computer"
                " science enthusiasts have been constantly working"
                " in this direction ."),
          ],
        ),
      ),
    );
  }
}
