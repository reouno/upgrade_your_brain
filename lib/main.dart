import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for [Scaffold].

void main() => runApp(const UpgradeYourBrainApp());

class UpgradeYourBrainApp extends StatelessWidget {
  const UpgradeYourBrainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Greeting0(),
    );
  }
}

class Greeting0 extends StatefulWidget {
  const Greeting0({super.key});

  @override
  State<Greeting0> createState() => _Greeting0State();
}

class _Greeting0State extends State<Greeting0> {
  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer(
      const Duration(milliseconds: 4500),
      () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return ExercisePage();
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const double begin = 0.0;
              const double end = 1.0;
              final Animatable<double> tween = Tween(begin: begin, end: end)
                  .chain(CurveTween(curve: Curves.easeInOut));
              final Animation<double> doubleAnimation = animation.drive(tween);
              return FadeTransition(
                opacity: doubleAnimation,
                child: child,
              );
            },
            transitionDuration: const Duration(seconds: 1),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            'Upgrade your brain step by step',
            speed: const Duration(milliseconds: 120),
          ),
        ],
        totalRepeatCount: 1,
        displayFullTextOnTap: false,
        stopPauseOnTap: false,
      ),
    ));
  }
}

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: DefaultTextStyle(
          style: TextStyle(fontSize: 30, color: Colors.black),
          child: Text('12 - 35 =')),
    ));
  }
}
