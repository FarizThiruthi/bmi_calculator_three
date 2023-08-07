import 'package:bmi_calculator_three/CitiesListView/cities.dart';
import 'package:bmi_calculator_three/FlipkartClone/flipkart.dart';
import 'package:bmi_calculator_three/ListNewSearch/listViewSearch.dart';
import 'package:bmi_calculator_three/Provider/provider_class.dart';
import 'package:bmi_calculator_three/Provider/todoProvider.dart';
import 'package:bmi_calculator_three/Quotes/quotes_app.dart';
import 'package:bmi_calculator_three/StateManagement/StatManagement2/fruits_app.dart';
import 'package:bmi_calculator_three/StateManagement/stsMangmnt.dart';
import 'package:bmi_calculator_three/TodoList/todoList.dart';
import 'package:bmi_calculator_three/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/provider_class_fruit_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderFruitApp()),
        ChangeNotifierProvider(create: (context) => Provider_Class()),
        ChangeNotifierProvider(create: (context) => ToDoProvider()),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        primaryColor: Colors.transparent,
        primarySwatch: Colors.grey,
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)
      ),
      home: ToDoList(),
    );
  }
}
