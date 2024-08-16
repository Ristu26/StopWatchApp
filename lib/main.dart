import 'package:flutter/material.dart';
import 'package:third_application/timer_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'StopWatch Page',
      home: const TimerScreen(),
    );
  }
}
