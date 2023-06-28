import 'package:bmi_calculator_three/calculation_screen.dart';
import 'package:bmi_calculator_three/home_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    FloatingActionButton(
                      heroTag: "F9",
                      backgroundColor: Colors.white,
                      mini: true,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return const CalculationScreen();
                        }));
                      },
                      child: const Icon(
                        Icons.change_circle,
                        color: Colors.black,
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Profile Info',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      heroTag: "F10",
                      backgroundColor: Colors.white,
                      mini: true,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
                      },
                      child: const Icon(
                        Icons.home,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('images/images.jpeg'),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Dr. APJ Abdul Kalam',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 9,
                          spreadRadius: 5,
                          //offset: Offset(5, 5),
                        ),
                      ]),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Icon(Icons.phone),
                        SizedBox(width: 10),
                        Text('00971-55-2210'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 9,
                          spreadRadius: 5,
                          //offset: Offset(5, 5),
                        ),
                      ]),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(width: 10),
                        Text('apjkalam@gmail.com'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
