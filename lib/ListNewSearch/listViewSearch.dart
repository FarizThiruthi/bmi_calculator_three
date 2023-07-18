import 'package:bmi_calculator_three/model/listSearchModel.dart';
import 'package:bmi_calculator_three/utils/colorfun.dart';
import 'package:flutter/material.dart';

class ListSearch extends StatefulWidget {
  const ListSearch({super.key});

  @override
  State<ListSearch> createState() => _ListSearchState();
}

class _ListSearchState extends State<ListSearch> {
  List listTitles = [
    ListSearchModel(title: 'Sports India', icon: Icons.ac_unit_outlined),
    ListSearchModel(title: 'Science India', icon: Icons.ice_skating_rounded),
    ListSearchModel(title: 'News India', icon: Icons.abc_sharp),
    ListSearchModel(title: 'World India'),
    ListSearchModel(title: 'News India', icon: Icons.abc_sharp),
    ListSearchModel(title: 'New Delhi'),
    ListSearchModel(
        title: 'Entertainment India', icon: Icons.access_alarms_rounded),
  ];

  String getInitialLetter(String title) {
    return title.isNotEmpty ? title[0].toUpperCase() : '';
  }

  Widget displayIcon(ListSearchModel model) {
    if (model.icon != null) {
      return CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Icon(model.icon),
      );
    } else {
      return CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Text(
          getInitialLetter(model.title),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    }
  }

  Widget displayIcon2(ListSearchModel model) {
    if (model.icon != null) {
      return CircleAvatar(
        child: Icon(Icons.done),
      );
    } else {
      return CircleAvatar(
        child: Icon(Icons.close),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello there'),
      ),
      body: ListView.builder(
        itemCount: listTitles.length,
        itemBuilder: (context, position) {
          return Container(
            height: 100,
            child: Card(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(color: Colors.grey.shade400),
                    child: Padding(
                      padding: const EdgeInsets.all(17),
                      child: CircleAvatar(
                        backgroundColor: randomColor(),
                        child: displayIcon(listTitles[position]),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(child: Text(listTitles[position].title)),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.grey.shade400,
                    child: displayIcon2(listTitles[position]),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
