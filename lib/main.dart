import 'package:bmi_calculator_three/CitiesListView/cities.dart';
import 'package:bmi_calculator_three/ListNewSearch/listViewSearch.dart';
import 'package:bmi_calculator_three/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(const MyApp());
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
      home: ListSearch(),
    );
  }
}
