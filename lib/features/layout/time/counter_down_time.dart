import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_islami/core/theme/app_colors.dart';

class CounterDownTime extends StatefulWidget {
  Duration timeRemaining;
  final void Function() getPrayingData;
  final void Function() playAzan;
  final void Function() stopAzan;

  CounterDownTime(
      {super.key,
      required this.getPrayingData,
      required this.timeRemaining,
      required this.playAzan,
      required this.stopAzan});

  @override
  State<CounterDownTime> createState() => _CounterDownState();
}

class _CounterDownState extends State<CounterDownTime> {
  late Timer timer;
  bool isMuted = false;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (widget.timeRemaining.inSeconds > 0) {
          widget.timeRemaining -= Duration(seconds: 1);
        } else {
          timer.cancel();
          widget.getPrayingData;
          widget.playAzan;
        }
      });
    });
    // TODO: implement initState
    super.initState();
  }

  void dispose() {
    timer.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String hours = duration.inHours.toString().padLeft(2, "0");
    String minutes =
        duration.inMinutes.remainder(60).toString().padLeft(2, "0");
    String seconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, "0");
    return "$hours:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(
          flex: 2,
        ),
        Text(
          'Pray Time-',
          style: TextStyle(color: AppColors.blackColor),
        ),
        AutoSizeText(_formatDuration(widget.timeRemaining),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        const Spacer(),
        IconButton(
            onPressed: () {
              setState(() {
                isMuted = !isMuted;
                if (isMuted) {
                  widget.stopAzan;
                }
              });
            },
            icon: Icon(
              isMuted ? CupertinoIcons.volume_off : Icons.volume_up,
              color: Colors.black,
              size: 25,
            )),
        const Spacer(),
      ],
    );
  }
}
