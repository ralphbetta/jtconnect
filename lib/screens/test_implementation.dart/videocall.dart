import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jtconnect/config/size.dart';
import 'package:jtconnect/main.dart';
import 'package:jtconnect/provider/timmer.dart';
import 'package:jtconnect/screens/tab/main.dart';
import 'package:provider/provider.dart';

class VideoCall extends StatefulWidget {
  final bool show;
  final Function()? closeAction;
  final Function()? expandAction;

  const VideoCall(
      {super.key, this.closeAction, this.expandAction, this.show = false});

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  /*--------------------------------------
  Timmer Digit Format Method
-----------------------------------------*/
  String strDigits(int n) => n.toString().padLeft(2, '0');

  @override
  void initState() {
    /*--------------------------------------
    On init state, check if the call is not 
    running then initiate the timmer else
    maintain the previous call state
   -----------------------------------------*/
    Timer(Duration(seconds: 1), () {
      print(context.read<CountNotifer>().running);
      if (!context.read<CountNotifer>().running) {
        context.read<CountNotifer>().startTimer();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*--------------------------------------
   Formatted time intervals
   -----------------------------------------*/
    final hours = strDigits(
        context.watch<CountNotifer>().myDuration.inHours.remainder(24));
    final minutes = strDigits(
        context.watch<CountNotifer>().myDuration.inMinutes.remainder(60));
    final seconds = strDigits(
        context.watch<CountNotifer>().myDuration.inSeconds.remainder(60));

    return WillPopScope(
      onWillPop: () async {
        /*--------------------------------------
          Method not tested
          This is meant to initiate overlay 
          if the user presses the back button
          -----------------------------------------*/

        if (true) {
          showOverlay(context);
          return false;
        }
      },
      child: Container(
        width: SizeConfig.getPercentageWidth(50),
        height: SizeConfig.getPercentageHeight(40),
        padding: EdgeInsets.all(
          SizeConfig.getPercentageWidth(4),
        ),
        decoration: BoxDecoration(
          color: !widget.show ? Colors.white : Colors.white.withOpacity(0.95),
          borderRadius: BorderRadius.circular(30),
          image:
              DecorationImage(image: NetworkImage(urlImage), fit: BoxFit.cover),
          border:
              Border.all(width: 1, color: Theme.of(context).primaryColorDark),
        ),
        child: Container(
          child: Column(
            children: [
              widget.show
                  ? Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: widget.closeAction,
                              child: Container(child: Icon(Icons.cancel))),
                          GestureDetector(
                              onTap: widget.expandAction,
                              child: Container(child: Icon(Icons.fullscreen))),
                          !widget.show
                              ? GestureDetector(
                                  onTap: widget.expandAction,
                                  child: Container(
                                      child: Icon(
                                    Icons.minimize_rounded,
                                    color: Colors.amber,
                                    size: 33,
                                  )))
                              : Container(),
                        ],
                      ),
                    )
                  : Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                showOverlay(context);

                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TabScreen()),
                                    (Route<dynamic> route) => false);
                              },
                              child: CircleAvatar(
                                  child: Text(
                                "-",
                                style: TextStyle(fontSize: 32),
                              )))
                        ],
                      ),
                    ),
              Expanded(flex: 4, child: Container()),
              Timing(
                hours: hours,
                minutes: minutes,
                seconds: seconds,
                bold: widget.show,
              ),
              /*----------------------------------------
              Call button Section with flex 1
              -----------------------------------*/
              Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: CircleAvatar(
                            child: Icon(Icons.mic_off),
                          ),
                        ),
                      )),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.getPercentageWidth(5)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            /*----------------------------------------
                            Terminate the call
                            -----------------------------------*/
                            context.read<CountNotifer>().stopTimer();
                            Timer(Duration(seconds: 3), () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CloudClinic()),
                                  (Route<dynamic> route) => false);
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor:
                                widget.show ? Colors.transparent : Colors.red,
                            child: Icon(Icons.call_end),
                          ),
                        ),
                      )),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            context.read<CountNotifer>().startTimer();
                          },
                          child: CircleAvatar(
                            child: Icon(Icons.volume_up),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*---------------------------------------------------------------
 Timing Widget to wrap within scaffold to remove yellow lines
---------------------------------------------------------------*/

class Timing extends StatelessWidget {
  const Timing({
    super.key,
    required this.hours,
    required this.minutes,
    required this.seconds,
    this.bold = false,
  });

  final String hours;
  final String minutes;
  final String seconds;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(children: [
        Center(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Text(
              '$hours:$minutes:$seconds',
              style: TextStyle(
                  fontWeight: bold ? FontWeight.w200 : FontWeight.bold,
                  color: Colors.black,
                  fontSize: bold ? 12 : 25),
            ),
          ),
        ),
      ]),
    ));
  }
}

/*---------------------------------------------------------------
 Overlay Function
---------------------------------------------------------------*/
void showOverlay(BuildContext context, {bool show = true}) {
  OverlayEntry? entry;
  Offset offset = Offset(0, SizeConfig.getPercentageHeight(55));

  entry = OverlayEntry(
    builder: (context) {
      return Positioned(
          left: offset.dx,
          top: offset.dy,
          child: GestureDetector(
            onPanUpdate: (details) {
              offset += details.delta;

              entry!.markNeedsBuild();
            },
            child: VideoCall(
              closeAction: () {
                entry!.remove();
                entry = null;
              },
              expandAction: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VideoCall()),
                );
                entry!.remove();
                entry = null;
              },
              show: true,
            ),
          ));
    },
  );

  final overlay = Overlay.of(context);
  overlay.insert(entry!);
}

String urlImage =
    "https://img.freepik.com/free-photo/young-woman-wearing-orange-dress-with-turban-ethnic-jewelry_273443-4387.jpg?w=740&t=st=1672135697~exp=1672136297~hmac=a0c128b2fc67de582a652ab24b52458a15c9b6157f00e617ffa03ad0409ded81";
