import 'package:flutter/material.dart';
import 'package:jtconnect/config/navigation.dart';
import 'package:jtconnect/config/size.dart';
import 'package:jtconnect/provider/timmer.dart';
import 'package:jtconnect/screens/onboarding/index.dart';
import 'package:provider/provider.dart';

import 'screens/test_implementation.dart/videocall.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CountNotifer())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InitScreen(),
    );
  }
}

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Onboarding();
  }
}

class CloudClinic extends StatefulWidget {
  const CloudClinic({super.key});

  @override
  State<CloudClinic> createState() => _CloudClinicState();
}

class _CloudClinicState extends State<CloudClinic> {
  @override
  void initState() {
    // If you need it to work on initialization
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   return showOverlay(context);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.getPercentageHeight(3),
            ),
            child: Text("Top text"),
          ),
          Center(
            child: ElevatedButton.icon(
                onPressed: () {
                  //showOverlay(context);
                  NavConfig.push(context, VideoCall());
                },
                icon: Icon(Icons.visibility),
                label: Text("Start")),
          )
        ],
      ),
    );
  }
}
