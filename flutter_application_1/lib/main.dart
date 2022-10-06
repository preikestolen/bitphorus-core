// ignore_for_file: unused_import

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

postData(String amount) async{
  // ignore: unused_local_variable
  var response = await http.post(
    Uri.parse("http://localhost:3000/"),
    body: {"amount": amount});

}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bitphorus P2P Bitcoin Exchange'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: buildColumn()
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Enter the amount of BTC you want to buy.'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              postData(_controller.text);
            });
          },
          child: const Text('Buy Bitcoin!'),
        ),
      ],
    );
  }
}