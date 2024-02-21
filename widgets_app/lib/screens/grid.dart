import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridScreen extends StatelessWidget {
  const GridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staggered Grid View'),
      ),
      body: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: Container(
              decoration: const BoxDecoration(color: Colors.amber),
              alignment: Alignment.center,
              child: const Text('0'),
            
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
           child: Container(
              decoration: const BoxDecoration(color: Color.fromARGB(255, 205, 255, 7)),
              alignment: Alignment.center,
              child: const Text('1'),
            
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Container(
              decoration: const BoxDecoration(color: Color.fromARGB(255, 247, 7, 255)),
              alignment: Alignment.center,
              child: const Text('2'),
            
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Container(
              decoration: const BoxDecoration(color: Color.fromARGB(255, 170, 240, 237)),
              alignment: Alignment.center,
              child: const Text('3'),
            
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 4,
            mainAxisCellCount: 4,
           child: Container(
              decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 120, 120)),
              alignment: Alignment.center,
              child: const Text('4'),
            
            ),
          ),
        ],
      ),
    );
  }
}
