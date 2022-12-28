import 'package:flutter/material.dart';
import 'package:jtconnect/provider/timmer.dart';
import 'package:provider/provider.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  // format Digits
  String strDigits(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final hours = strDigits(
        context.watch<CountNotifer>().myDuration.inHours.remainder(24));
    final minutes = strDigits(
        context.watch<CountNotifer>().myDuration.inMinutes.remainder(60));
    final seconds = strDigits(
        context.watch<CountNotifer>().myDuration.inSeconds.remainder(60));

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  context.read<CountNotifer>().startTimer();
                },
                child: Text("Start/continue")),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () {
                  context.read<CountNotifer>().pauseTimer();
                },
                child: Text("pause")),
            ElevatedButton(
                onPressed: () {
                  context.read<CountNotifer>().stopTimer();
                },
                child: Text("Stop")),
            Text(
              '$hours:$minutes:$seconds',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}
