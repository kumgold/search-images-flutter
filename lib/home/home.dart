import 'package:flutter/material.dart';
import 'package:matzip/home/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => HomeProvider(),
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('XXX'),

            ],
          ),
        ),
      ),
    );
  }
}