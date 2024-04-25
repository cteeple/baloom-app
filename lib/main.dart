import 'package:baloom/pages/profile_page.dart';
import 'package:baloom/pages/settings_page.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Baloom',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent),
          textTheme: TextTheme(
            headlineMedium:
                TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
          ),
        ),
        home: AppStruct(),
      ),
    );
  }
}

class AppState extends ChangeNotifier {
  var current = WordPair.random();
}

class AppStruct extends StatefulWidget {
  AppStruct({super.key});

  final List pages = [
    HomePage(),
    SettingsPage(),
    ProfilePage(),
  ];

  @override
  State<AppStruct> createState() => _AppStructState();
}

class _AppStructState extends State<AppStruct> {
  int currentIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        shadowColor: Colors.white,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
      ),
      body: widget.pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          navigateBottomBar(index);
        },
      ),
    );
  }
}
