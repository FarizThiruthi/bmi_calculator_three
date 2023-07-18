
import 'package:bmi_calculator_three/model/dashboardModel.dart';
import 'package:bmi_calculator_three/utils/colorfun.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool forAndroid = true;
  List places = [
    dashboardModel(
      title: "Evening",
      subTitle: "Best way to spent eve",
    ),
    dashboardModel(
      title: 'Sky',
      subTitle: 'Sky cant be better',
    ),
    dashboardModel(
      title: 'Sky and road',
      subTitle: 'Road cannot be better',
    ),
    dashboardModel(
      title: 'Moon at Night',
      subTitle: 'Moon at night may shine like a sun',
    ),
    dashboardModel(
      title: 'Tree',
      subTitle: 'Tree with empty leaves',
    )
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Kit'),
        actions: [
          Switch(
            activeColor: Colors.white,
            activeTrackColor: Colors.grey.shade400,
            onChanged: (value) => setState(() => forAndroid = value),
            value: forAndroid,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              childAspectRatio: 1.5,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone_android_rounded, size: 100),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Default Theme',
                        style: TextStyle(
                            color: Colors.white54,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.api, size: 100),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Full Apps',
                        style: TextStyle(
                            color: Colors.white54,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.public, size: 100),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Integration',
                        style: TextStyle(
                            color: Colors.white54,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.dashboard, size: 100),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Dashboard',
                        style: TextStyle(
                            color: Colors.white54,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Themes',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, position) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: randomColor(),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                blurRadius: 5,
                                spreadRadius: 9,
                              )
                            ]),
                        height: 100,
                        width: 120,
                        child: Icon(Icons.ice_skating),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade200,
                                    blurRadius: 9,
                                    spreadRadius: 5,
                                  )
                                ]),
                            height: 100,
                            width: 250,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (places[position].title),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  places[position].subTitle,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              top: 30,
                              right: -7,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: randomColor(),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 25,
                                ),
                              ))
                        ],
                      ),
                    ]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
