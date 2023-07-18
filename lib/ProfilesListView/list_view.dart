import 'package:bmi_calculator_three/ProfilesListView/ListViewResult.dart';
import 'package:bmi_calculator_three/model/listModel.dart';
import 'package:flutter/material.dart';

class ListNavigation extends StatefulWidget {
  const ListNavigation({super.key});

  @override
  State<ListNavigation> createState() => _ListNavigationState();
}

class _ListNavigationState extends State<ListNavigation> {
  List cities = [
    listModel(
        image: "images/img1.jpg",
        title: "Evening",
        subTitle: "Best way to spent eve"),
    listModel(
      image: 'images/img2.jpg',
      title: 'Sky',
      subTitle: 'Sky cant be better',
    ),
    listModel(
        image: 'images/img3.jpg',
        title: 'Sky and road',
        subTitle: 'Road cannot be better'),
    listModel(
        image: 'images/img4.jpg',
        title: 'Moon at Night',
        subTitle: 'Moon at night may shine like a sun'),
    listModel(
        image: 'images/img5.jpg',
        title: 'Tree',
        subTitle: 'Tree with empty leaves')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profiles'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            String img = cities[index].image;
            String title = cities[index].title;
            String subtitle = cities[index].subTitle;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(cities[index].image),
                ),
                title: Text(cities[index].title),
                subtitle: Text(cities[index].subTitle),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListViewResult(
                              image: img, title: title, subtitle: subtitle)));
                },
              ),
            );
          },
          itemCount: cities.length,
        ));
  }
}
