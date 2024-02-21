import 'package:flutter/material.dart';

class ListOne extends StatelessWidget {
  const ListOne({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          height: 230,
          width: 230,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(3)),
            color: Color.fromARGB(255, 255, 128, 128),
          ),
          child: const Icon(Icons.ac_unit),
        ),
        Container(
          height: 230,
          width: 230,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(3)),
            color: Color.fromARGB(255, 128, 240, 255),
          ),
          child: const Icon(Icons.back_hand),
        ),
        Container(
          height: 230,
          width: 230,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(3)),
            color: Color.fromARGB(255, 202, 255, 128),
          ),
          child: const Icon(Icons.cabin),
        ),
      ],
    );
  }
}
