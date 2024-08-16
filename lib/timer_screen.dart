import 'dart:async';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int count = 0;
  late Timer timer;
  StreamController<int> timerController = StreamController.broadcast();
  StreamController<List<int>> lapsController = StreamController.broadcast();
  List<int> laps = [];

  @override
  void dispose() {
    timerController.close();
    super.dispose();
  }

  void onClickLap() {
    laps.add(count);
    lapsController.add(laps);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 209, 142, 254),
        title: Text(
          'Timer App',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: 200,
                width: 150,
                child: Stack(
                  children: [
                    Center(
                      child: StreamBuilder<int>(
                        stream: timerController.stream,
                        builder: (context, snapshot) {
                          return Text(
                            'Count : ${snapshot.data ?? 0}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  SizedBox.square(
                    dimension: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      timer.cancel();
                    },
                    child: Text('Stop Timer'),
                  ),
                  SizedBox.square(
                    dimension: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      count = 0;
                      timerController.add(count);
                      laps.clear();
                      lapsController.add(laps);
                    },
                    child: Text('Reset Timer'),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox.square(
                  dimension: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    onClickLap();
                  },
                  child: Text('Lap Timer'),
                ),
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: ElevatedButton(
                    onPressed: () {
                      timer = Timer.periodic(Duration(seconds: 1), (timer) {
                        timerController.add(++count);
                      });
                    },
                    child: Icon(Icons.play_arrow),
                  ),
                ),
              ],
            ),
            Expanded(
              child: StreamBuilder<List<int>>(
                stream: lapsController.stream,
                builder: (context, snapshot) {
                  if (snapshot.data?.isEmpty == true || snapshot.data == null) {
                    return Center(
                      child: Text('No Lap'),
                    );
                  } else {
                    final allLaps = snapshot.data;
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: allLaps?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        final lap = allLaps![(allLaps.length - 1) - index];
                        return Column(
                          children: [
                            Text(
                              'Lap ${index + 1}: $lap',
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
