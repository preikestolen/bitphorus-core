import 'package:flutter/material.dart';
import '../libold/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = const [
		ProfilePage()
	];
  @override
  Widget build(BuildContext context) {
    // in scaffold we have from top to bottom
    // app bar -> body -> navigation bar
    return Scaffold(
      appBar: AppBar(
        title: const Text("P2P Bitcoin Exchange"),
      ),
      body: pages[currentPage],
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     debugPrint("Button is pressed");
      //   },
      //   // child is what will be inside the button (widget)
      //   // inside is another widget called Icon
      //   child: const Icon(Icons.currency_bitcoin),
      // ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.currency_bitcoin), label: "Buy BTC"),
          NavigationDestination(
              icon: Icon(Icons.account_circle_outlined), label: "Account"),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
