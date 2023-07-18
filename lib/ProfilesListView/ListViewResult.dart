import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bmi_calculator_three/home_page.dart';
import 'package:bmi_calculator_three/ProfilesListView/list_view.dart';
import 'package:flutter/material.dart';

class ListViewResult extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;

  ListViewResult(
      {required this.image, required this.title, required this.subtitle});

  @override
  State<ListViewResult> createState() => _ListViewResultState();
}

class _ListViewResultState extends State<ListViewResult> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  FloatingActionButton(
                    heroTag: "F19",
                    backgroundColor: Colors.white,
                    mini: true,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return const ListNavigation();
                      }));
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    heroTag: "F20",
                    backgroundColor: Colors.white,
                    mini: true,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return const Homepage();
                      }));
                    },
                    child: const Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                  radius: 150,
                  backgroundImage: AssetImage(
                    widget.image,
                  )),
              SizedBox(
                height: 20,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    widget.subtitle,
                    textStyle: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                    ),
                    speed: const Duration(milliseconds: 500),
                  ),
                ],
                totalRepeatCount: 4,
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
