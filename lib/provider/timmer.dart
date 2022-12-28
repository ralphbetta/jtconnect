import 'dart:async';
import 'package:flutter/material.dart';

class CountNotifer extends ChangeNotifier {
  bool _running = false;
  bool get running => _running;

  Timer? _countdownTimer;
  Duration _myDuration = Duration();

  Timer get countdownTimer => _countdownTimer!;
  Duration get myDuration => _myDuration;

  /// Timer related methods ///
  void startTimer() {
    _countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountUp());
    _running = true;

    notifyListeners();
  }

  void setCountUp() {
    const increaseSecondsBy = 1;
    final seconds = _myDuration.inSeconds + increaseSecondsBy;
    if (seconds < 0) {
      _countdownTimer!.cancel();
    } else {
      _myDuration = Duration(seconds: seconds);
    }

    notifyListeners();
  }

  // Terminate timmer
  void pauseTimer() {
    _countdownTimer!.cancel();
    notifyListeners();
  }

//Reset Timmer
  void stopTimer() {
    pauseTimer();
    _myDuration = const Duration();
    _running = false;
    notifyListeners();
  }
}
