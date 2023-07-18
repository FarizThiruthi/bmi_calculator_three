import 'package:bmi_calculator_three/home_page.dart';
import 'package:bmi_calculator_three/model/cityModel.dart';
import 'package:flutter/material.dart';

class City extends StatefulWidget {
  const City({super.key});

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  List city = [
    CityModel(
        image: "images/img1.jpg",
        title: "Evening",
        subTitle: "Best way to spent eve"),
    CityModel(
      image: 'images/img2.jpg',
      title: 'Sky',
      subTitle: 'Sky cant be better',
    ),
    CityModel(
        image: 'images/img3.jpg',
        title: 'Sky and road',
        subTitle: 'Road cannot be better'),
    CityModel(
        image: 'images/img4.jpg',
        title: 'Moon at Night',
        subTitle: 'Moon at night may shine like a sun'),
    CityModel(
        image: 'images/img5.jpg',
        title: 'Tree',
        subTitle: 'Tree with empty leaves')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Homepage()));
                },
                child: Icon(Icons.home)),
          )
        ],
        title: Text('City'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: city.length,
            itemBuilder: (context, position) {
              return Container(
                height: 100,
                child: Card(
                  color: Colors.grey.shade300,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 110,
                        child: Image(
                            fit: BoxFit.fill,
                            //width: 50,
                            height: 90,
                            image: AssetImage(city[position].image)),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(city[position].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                          Text(
                            city[position].subTitle,
                            style: TextStyle(fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
