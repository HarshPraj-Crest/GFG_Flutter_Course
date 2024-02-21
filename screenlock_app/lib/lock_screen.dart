import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() {
    return _LockScreenState();
  }
}

class _LockScreenState extends State<LockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lock Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Spacer(flex: 3),
            OutlinedButton(
              onPressed: () {
                setState(
                  () {
                    print('Enabling wakelock');
                    Wakelock.enable();
                  },
                );
              },
              child: const Text('Enable wakelock'),
            ),
            const Spacer(),
            OutlinedButton(
              onPressed: () {
                setState(
                  () {
                    print('Disabling wakelock');
                    Wakelock.disable();
                  },
                );
              },
              child: const Text('Disable wakelock'),
            ),
            const Spacer(flex: 2),
            FutureBuilder(
              future: Wakelock.enabled,
              builder: (context, snapshot) {
                print("Snapshot data: ${snapshot.data}");
                if (!snapshot.hasData) {
                  return Container();
                }

                return Text('The wakelock is currently '
                    '${snapshot.data! ? 'enabled' : 'disabled'}.');
              },
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
