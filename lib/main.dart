import 'package:flutter/material.dart';
import 'package:web_socket/homescreen.dart';
import 'package:web_socket_channel/io.dart';

void main() {
  runApp(const MyApp());
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
      home:   Homescreen(channel: new IOWebSocketChannel.connect("ws:// echo.websocket.org ")),
    );
  }
}

