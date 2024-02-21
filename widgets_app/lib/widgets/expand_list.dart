import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class ExpandList extends StatefulWidget {
  const ExpandList({super.key});

  @override
  State<ExpandList> createState() {
    return _ExpandListState();
  }
}

class _ExpandListState extends State<ExpandList> {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: ExpansionTileCard(
            key: cardB,
            leading: const CircleAvatar(child: Text('A')),
            title: const Text('Tap to Expand!'),
            subtitle: const Text('It has the GFG Logo.'),
            children: const [
              Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Icon(Icons.image),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
