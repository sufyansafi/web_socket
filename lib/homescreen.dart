import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key, required this.channel});
  final WebSocketChannel channel;
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Web Socket implementation",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Center(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  label: Text(
                      "Send any message to web socket and return what u send"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: widget.channel.stream,
                builder: (context, snapshot) {
//if snapshot has data then show data
                  return Text(snapshot.hasData ? '${snapshot.data}' : "");
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
          onPressed: () {
            sendMessage();
          },
          child: Icon(
            Icons.send,
            color: Color.fromRGBO(250, 191, 14, 1),
          )),
    );
  }

  sendMessage() {
    if (controller.text.isNotEmpty) {
      widget.channel.sink.add(controller.text);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.channel.sink.close();
  }
}
