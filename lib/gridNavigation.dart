import 'package:bmi_calculator_three/model/gridModel.dart';
import 'package:flutter/material.dart';

class GridNavigation extends StatefulWidget {
  const GridNavigation({super.key});

  @override
  State<GridNavigation> createState() => _GridNavigationState();
}

class _GridNavigationState extends State<GridNavigation> {
  List cities = [
    gridModel(
        image: "images/img1.jpg",
        title: "Evening",
        subTitle: "Best way to spent eve"),
    gridModel(
      image: 'images/img2.jpg',
      title: 'Sky',
      subTitle: 'Sky cant be better',
    ),
    gridModel(
        image: 'images/img3.jpg',
        title: 'Sky and road',
        subTitle: 'Road cannot be better'),
    gridModel(
        image: 'images/img4.jpg',
        title: 'Moon at Night',
        subTitle: 'Moon at night may shine like a sun'),
    gridModel(
        image: 'images/img5.jpg',
        title: 'Tree',
        subTitle: 'Tree with empty leaves')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 / 3,
            mainAxisExtent: 250,
          ),
          itemCount: cities.length,
          itemBuilder: (context, index) {
            String img = cities[index].image;
            String title = cities[index].title;
            String subtitle = cities[index].subTitle;
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: GridTile(
                  footer: GridTileBar(
                    backgroundColor: Colors.black54,
                    title: Text(cities[index].title),
                    subtitle: Text(cities[index].subTitle),
                    trailing: const Icon(Icons.star_border),
                  ),
                  child: Image(
                    image: AssetImage(cities[index].image),
                    fit: BoxFit.cover,
                  )),
            );
          }),
    );
  }
}
