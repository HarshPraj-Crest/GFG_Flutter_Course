import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgets_app/screens/form_val.dart';
import 'package:widgets_app/screens/grid.dart';
import 'package:widgets_app/screens/int_data.dart';
import 'package:widgets_app/screens/lazy_loading.dart';
import 'package:widgets_app/screens/lottie_animation.dart';
import 'package:widgets_app/screens/orientation.dart';
import 'package:widgets_app/screens/skeleton.dart';
import 'package:widgets_app/widgets/dialog.dart';
import 'package:widgets_app/widgets/expand_list.dart';
import 'package:widgets_app/widgets/list.dart';
import 'package:widgets_app/widgets/progress.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.music_note)),
            Tab(icon: Icon(Icons.music_video)),
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(icon: Icon(Icons.play_circle)),
          ]),
          title: const Text('Basic App'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.message),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FormValScreen(),
              ),
            );
          },
          child: const Icon(Icons.dataset_outlined),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: Text(
                    'This is drawer',
                    style: GoogleFonts.aleo(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text(' Skeleton Text '),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SkeletonScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.book),
                title: const Text(' Staggered Grid View '),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GridScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.workspace_premium),
                title: const Text(' Lazy loading '),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LazyLoading(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.animation),
                title: const Text(' Lottie Animation '),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LottieAnimation(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.rotate_90_degrees_ccw_outlined),
                title: const Text(' Orientation '),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrientationScreen(),
                    ),
                  );
                },
              ),
               ListTile(
                leading: const Icon(Icons.http),
                title: const Text(' Http data '),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IntDataScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ListOne(),
            ExpandList(),
            DialogBox(),
            Progress(),
          ],
        ),
      ),
    );
  }
}
