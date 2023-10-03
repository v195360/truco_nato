import 'package:flutter/material.dart';
import 'match_history.dart';
import 'friend_group.dart';
import 'profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
           home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: TabBarView(children: [
            MatchHistory(),
            //FriendGroup(),
            Profile(),

          ]),
          appBar: AppBar(
            backgroundColor: Color(0XFFBfa2632),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.history)),
               // Tab(icon: Icon(Icons.groups_2_rounded)),
                Tab(icon: Icon(Icons.switch_account_rounded),)
              ],
            ),
            title: Row(
              children: [
                Image.asset(
                  'assets/images/truconato.jpeg', // Replace with your image asset path
                  height: 60, // Set the desired height
                ),
                const SizedBox(width: 5), // Add some spacing between image and text
                const Text("TrucoNato"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
      
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
