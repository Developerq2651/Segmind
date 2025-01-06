import 'package:flutter/material.dart';
import 'package:try4/card/button.dart';
import 'package:try4/card/icons.dart';
import 'package:try4/card/image.dart';
import 'package:try4/card/text.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.fromLTRB(12, 10, 0, 5),
                child: TextSection(label: "Here's your results")),
            Container(
              margin: EdgeInsets.fromLTRB(12, 1, 12, 5),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  ),
                  border: Border.all(
                    color: const Color.fromARGB(
                        255, 48, 47, 46), // Set the border color here
                    width: 1.0, // Set the border width here
                  )),
              child: Padding(
                padding: EdgeInsets.fromLTRB(2, 8, 2, 16),
                child: Row(
                  children: [
                    ImageSection(
                      imagePath: 'assets/image/christmas_image.png',
                      height: 50,
                      width: 50,
                    ),
                    Text(" -------------------------------------")
                  ],
                ),
              ),
            ),
            ImageSection(
              imagePath: 'assets/image/christmas_image.png',
              height: 300,
              width: 400,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.grey[900], // Background color for the bottom bar
          // Define a fixed height for the BottomAppBar
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconSection1(
                icon: Icons.restart_alt,
                iconSize: 35,
                width: 50,
                height: 40,
              ),
              SizedBox(
                width: 8,
              ),
              IconSection1(
                icon: Icons.save_rounded,
                iconSize: 35,
                width: 50,
                height: 40,
              ),
              SizedBox(
                width: 8,
              ),
              IconSection1(
                icon: Icons.image_outlined,
                iconSize: 35,
                width: 50,
                height: 40,
              ),
              SizedBox(
                width: 2,
              ),
              Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ButtonSection(
                        label: "Run Workflow",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultScreen()));
                        },
                        width: 175,
                      ),
                    ],
                  ))
            ],
          )),
    );
  }
}
