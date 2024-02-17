import 'package:flutter/material.dart';
import 'package:matzip/data/place_card.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('XXX'),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: context.read<HomeProvider>().recommendList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return placeCard(context.read<HomeProvider>().recommendList[index]);
                    }
                )
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget placeCard(PlaceCard place) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.blue,
              height: 100,
              width: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(place.name),
                Text(place.rating)
              ],
            ),
            Text(place.description)
          ],
        ),
      ),
    );
  }
}