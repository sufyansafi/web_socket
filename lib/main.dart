// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:web_socket/homescreen.dart';
import 'package:web_socket_channel/io.dart';
//import 'package:web_socket_channel/io.dart';//

// import 'package:web_socket_channel/status.dart' as status;

void main() async {
  // final channel = IOWebSocketChannel.connect('ws://localhost:1234');

  // channel.stream.listen((message) {
  //   channel.sink.add('received!');
  //   channel.sink.close(status.goingAway);
  // });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Homescreen(
          channel: new IOWebSocketChannel.connect('ws://localhost:1234')),
    );
  }
}
