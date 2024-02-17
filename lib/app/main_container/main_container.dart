import 'package:flutter/material.dart';
import 'package:matzip/app/search/search.dart';
import 'package:matzip/app/util/resources.dart';

import '../home/home.dart';

class ContainerScreen extends StatefulWidget {
  const ContainerScreen({super.key});

  @override
  State<ContainerScreen> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> title = [
      StringResources.of(context).getText('home'),
      StringResources.of(context).getText('search'),
      StringResources.of(context).getText('my_favorite')
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          title[_selectedIndex],
          style: const TextStyle(
              color: Colors.white
          ),
        ),
      ),
      body: <Widget>[
        const HomeScreen(),
        const SearchScreen(),
        _myFavoriteScreen
      ][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: StringResources.of(context).getText('home')
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.search),
              label: StringResources.of(context).getText('search')
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.favorite),
              label: StringResources.of(context).getText('my_favorite')
          )
        ],
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  final Widget _myFavoriteScreen = const Column();
}
