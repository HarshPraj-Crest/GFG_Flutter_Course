import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatefulWidget {
  const LottieAnimation({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LottieAnimationState();
  }
}

class _LottieAnimationState extends State<LottieAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lottie Animation'),
      ),
      body: Center(
        child: Column(children: [
          Lottie.network( 
                  'https://assets1.lottiefiles.com/private_files/lf30_QLsD8M.json', 
                height: 300, 
                repeat: true, 
                reverse: true, 
                animate: true, 
              ), 
  
              Lottie.network( 
                  'https://assets1.lottiefiles.com/private_files/lf30_yQtj4O.json',
                  height: 300, 
                  repeat: true, 
                  reverse: true, 
                  animate: true, 
              ), 
        ]),
      ),
    );
  }
}
