import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  int _currentIndex = 0;

  List<Widget> pages = [
    const Center(
      child: Text("Page 1"),
    ),
    const Center(
      child: Text("Page 2"),
    ),
    const Center(
      child: Text("Page 3"),
    ),
  ];
  List<Widget> actionButtons = [
    FloatingActionButton(
      onPressed: () {},
      tooltip: 'Page 1',
      foregroundColor: Colors.black,
      backgroundColor: Colors.orangeAccent,
      child: const Icon(Icons.add),
    ),
    FloatingActionButton(
      onPressed: () {},
      tooltip: 'Page 2',
      foregroundColor: Colors.black,
      backgroundColor: Colors.redAccent,
      child: const Icon(Icons.edit),
    ),
    FloatingActionButton(
      onPressed: () {},
      tooltip: 'Page 3',
      foregroundColor: Colors.black,
      backgroundColor: Colors.blueAccent,
      child: const Icon(Icons.delete),
    ),
  ];
  List<AppBar> appBarList = [
    AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("Page 1"),
        centerTitle: true,
      ),
      AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Page 2"),
        centerTitle: true,
      ),
      AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Page 3"),
        centerTitle: true,
      ),
  ];
  List<Color> colorList =[
    Colors.orangeAccent,
    Colors.redAccent,
    Colors.blueAccent,
  ];
  onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarList[_currentIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
             DrawerHeader(
              decoration: BoxDecoration(
                color: colorList[_currentIndex],
              ),
              child: Text('Change Pages'),
            ),
            ListTile(
              leading: const Icon(
                Icons.pages,
              ),
              title: const Text('Page 1'),
              onTap: () {
                onTap(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.pages,
              ),
              title: const Text('Page 2'),
              onTap: () {
                onTap(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.pages,
              ),
              title: const Text('Page 3'),
              onTap: () {
                onTap(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: pages[_currentIndex],
      floatingActionButton: actionButtons[_currentIndex],
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
            onPressed: () {
              onTap(0);
            },
            child: const Text("Page 1"),
          ),
          MaterialButton(
            onPressed: () {
              onTap(1);
            },
            child: const Text("Page 2"),
          ),
          MaterialButton(
            onPressed: () {
              onTap(2);
            },
            child: const Text("Page 3"),
          ),
        ],
      ),
    );
  }
}
