import 'package:flutter/material.dart';

import '../home/home.dart';

class ContainerScreen extends StatefulWidget {
  const ContainerScreen({super.key});

  @override
  State<ContainerScreen> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  final List<String> _title = [
    'Home',
    'Search',
    'My Favorite'
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          _title[_selectedIndex],
          style: const TextStyle(
              color: Colors.white
          ),
        ),
      ),
      body: <Widget>[
        const HomeScreen(),
        _searchScreen,
        _myFavoriteScreen
      ][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'My Favorite'
          )
        ],
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  final Widget _searchScreen = const Column();

  final Widget _myFavoriteScreen = const Column();
}
