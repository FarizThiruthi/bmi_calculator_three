import 'package:bmi_calculator_three/Provider/provider_class.dart';
import 'package:bmi_calculator_three/StateManagement/stManagmtResult.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StateManagement extends StatefulWidget {
  const StateManagement({super.key});

  @override
  State<StateManagement> createState() => _StateManagementState();
}

List<String> words = [
  'Time',
  'Year',
  'People',
  'Way',
  'Day',
  'Man',
  'Thing',
  'Women'
];

class _StateManagementState extends State<StateManagement> {
  @override
  Widget build(BuildContext context) {
    final object = Provider.of<Provider_Class>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        clipBehavior: Clip.hardEdge,
        title: Text('Words'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: words.length,
              itemBuilder: (context, index) => ListTile(
                  title: Text(words[index]),
                  trailing: IconButton(
                    onPressed: () {
                      object.favorites(words[index]);
                    },
                    icon: object.icn_change(words[index])
                        ? Icon(
                            Icons.favorite,
                            color: Colors.blue,
                          )
                        : Icon(Icons.favorite_border),
                  ),),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FavoritesScreen()));
        },
        icon: Icon(Icons.favorite_border),
        label: Text('Favorites'),
        backgroundColor: Colors.white,
      ),
    );
  }
}
