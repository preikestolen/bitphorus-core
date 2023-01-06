// ignore_for_file: unused_import

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

postData(String amount, String wallet) async {
  // ignore: unused_local_variable
  var response = await http.post(Uri.parse("http://127.0.0.1:3000"),
      body: {"amount": amount, "wallet": wallet});
}

postData2(String username, String password) async {
  // ignore: unused_local_variable
  var response = await http.post(Uri.parse("http://127.0.0.1:3000"),
      body: {"username": username, "password": password});
}

checkUsername(String username) {
  if (username.length > 21) {
    // ignore: avoid_print
    print("username length can not be bigger than 21");
  } else {
    // username length should be less then 21
    // and first character should not be numeric
    if (username.isEmpty) {
      // ignore: avoid_print
      print("username can not be empty");
    } else {
      RegExp exp = RegExp(r"[a-zA-Z]+.*");
      if (exp.hasMatch(username)) {
        // ignore: avoid_print
        print("username OK");
      } else {
        // ignore: avoid_print
        print("username should start with letters");
      }
    }
  }
}

checkPassword(String username, String password) {
  if (password.length <= 1) {
    // ignore: avoid_print
    print("password length must be larger than 1");
  } else {
    if (username == password) {
      // ignore: avoid_print
      print("username and password should not be the same");
    } else {
      // ignore: avoid_print
      print("password OK");
    }
  }
}

checkBtcAmount(String amount) {
  RegExp exp = RegExp(r"^[0-9]{1,}\.[0-9]+$");
  RegExp exp2 = RegExp(r"^[0-9]+$");
  if (exp.hasMatch(amount) || exp2.hasMatch(amount)) {
    // ignore: avoid_print
    print("amount OK");
  } else {
    // ignore: avoid_print
    print("amount should only have digits");
    return false;
  }
}

checkBtcWallet(String wallet) {
  if (wallet.isEmpty) {
    // ignore: avoid_print
    print("Wallet address is invalid!");
    return false;
  } else {
    if (wallet.startsWith("1") ||
        wallet.startsWith("3") ||
        wallet.startsWith("bc")) {
      // ignore: avoid_print
      print("Wallet address OK");
    } else {
      // ignore: avoid_print
      print("Wallet address is invalid!");
      return false;
    }
  }
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
  final TextEditingController _controller0 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  int currentPageIndex = 0;
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
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            selectedIndex: currentPageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              NavigationDestination(
                icon: Icon(Icons.account_balance),
                label: "Account",
              ),
            ],
          ),
          body: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: buildColumn(),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: buildColumn2(),
            ),
          ][currentPageIndex],
        ));
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 50.0),
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              'images/bitphorus-btc.png',
              width: 100,
              height: 100,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'The amount of BTC that you want to buy',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.black),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: TextField(
            controller: _controller0,
            decoration: const InputDecoration(
              hintText: 'Enter your BTC wallet address to receive',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.black),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              checkBtcAmount(_controller.text);
              checkBtcWallet(_controller0.text);
              if (checkBtcAmount(_controller.text) == false ||
                  checkBtcWallet(_controller0.text) == false) {
                // ignore: avoid_print
                print("BTC amount or wallet address is wrong");
                // ignore: avoid_print
                print("Order does not send to merchant");
              }
              else {
                postData(_controller.text, _controller0.text);
              }
            });
          },
          child: const Text('Buy Bitcoin!'),
        ),
      ],
    );
  }

  Column buildColumn2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 25.0),
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              'images/bitphorus-btc.png',
              width: 100,
              height: 100,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: TextField(
            controller: _controller2,
            decoration: const InputDecoration(
              hintText: 'Username',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.black),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: TextField(
            controller: _controller3,
            decoration: const InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.black),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // ignore: avoid_print
            print("${_controller2.text} , ${_controller3.text}");
            checkUsername(_controller2.text);
            checkPassword(_controller2.text, _controller3.text);
            // setState(() {
            //   postData2(_controller2.text, _controller3.text);
            // });
          },
          child: const Text('Login'),
        ),
      ],
    );
  }
}
