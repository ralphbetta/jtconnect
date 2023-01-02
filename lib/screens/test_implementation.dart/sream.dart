// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rxdart/streams.dart';
// import 'package:web_socket_channel/io.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';

// class DisplayNotifier extends ChangeNotifier {
//   //---------------------------------------------------
//   //--------------- Initialize App State
//   //---------------------------------------------------

//   DisplayNotifier() {
//     init();
//   }

//   Map _fetchedData = {};
//   Map get fetchedData => _fetchedData;

//   int _id = 0;
//   int get id => _id;

//   WebSocketChannel dataChannel = IOWebSocketChannel.connect(
//       "wss://stream.binance.com:9443/ws/etheur@trade");

//   void load(Object? object) {
//     print("this is te object $object");
//     _id = _id + 1;
//     //notifyListeners();
//   }

//   Future<void> test() async {
//     dataChannel.stream.listen((data) {
//       _fetchedData = data;
//       notifyListeners();
//     });
//   }

//   Future<void> init() async {
//     dataChannel.stream.listen((data) {
//       print(data);
//       _fetchedData = jsonDecode(data);
//       notifyListeners();
//     });
//     //Well controlled stream process with rxdart
//     // RetryWhenStream<String>(
//     //   () => Stream.periodic(const Duration(seconds: 1), (i) => i).map((i) {
//     //     return "test";
//     //   }),
//     //   (e, s) {
//     //     return Stream.value("value");
//     //   },
//     // ).listen(load, onError: print);
//   }
// }

// class TestScreen extends StatelessWidget {
//   const TestScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     context.watch<DisplayNotifier>().fetchedData;
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(child: Text(context.watch<DisplayNotifier>().id.toString())),
//     );
//   }
// }
