import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_images_flutter/favorite/favorite_screen.dart';
import 'package:search_images_flutter/favorite/favorite_view_model.dart';
import 'package:search_images_flutter/search/search_screen.dart';
import 'package:search_images_flutter/search/search_view_model.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SearchViewModel()),
          ChangeNotifierProvider(create: (_) => FavoriteViewModel())
        ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  var screen = [
    SearchScreen(),
    FavoriteScreen()
  ];

  int _index = 0;

  void onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '검색'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: '즐겨찾기'
          )
        ],
        currentIndex: _index,
        onTap: onItemTapped,
      ),
    );
  }
}
