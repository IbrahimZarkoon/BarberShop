import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../Constants/colors.dart';

class TimerWidget extends StatefulWidget {
  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late StreamController<int> _timerStreamController;
  late Timer _timer;
  int _secondsLeft = 30 * 60 + 20; // 30 minutes and 20 seconds

  @override
  void initState() {
    super.initState();

    _timerStreamController = StreamController<int>();

    // Set up a timer that runs every second
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsLeft > 0) {
        _secondsLeft--;
        _timerStreamController.add(_secondsLeft);
      } else {
        _timer.cancel(); // Stop the timer when it reaches 0
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    _timerStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Text(
        //   'Time Left:',
        //   style: TextStyle(fontSize: 20),
        // ),
        StreamBuilder<int>(
          stream: _timerStreamController.stream,
          builder: (context, snapshot) {
            int minutes = (snapshot.data ?? 0) ~/ 60;
            int seconds = (snapshot.data ?? 0) % 60;
            return Text(
              '$minutes:${seconds.toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.03, fontWeight: FontWeight.bold,color: white),
            );
          },
        ),
      ],
    );
  }
}