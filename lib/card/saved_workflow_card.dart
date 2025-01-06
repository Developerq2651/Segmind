import 'package:flutter/material.dart';
import 'package:try4/card/button.dart';
import 'package:try4/card/icons.dart';
import 'package:try4/card/image.dart';
import 'package:try4/card/text.dart';
import 'package:try4/workflow/workflow.dart';

class SavedWorkflowcard extends StatelessWidget {
  const SavedWorkflowcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(221, 51, 48, 48),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                ImageSection(imagePath: 'assets/image/christmas_image.png'),
                Column(
                  children: [
                    ImageSection2(
                        imagePath: 'assets/image/christmas_image.png'),
                    ImageSection2(imagePath: 'assets/image/christmas_image.png')
                  ],
                )
              ],
            )
            // Image Section
            ,
            Row(
              children: [
                IconSection(icon: Icons.stars, label: "Flux 1.3"),
                SizedBox(
                  width: 7,
                ),
                IconSection1(icon: Icons.play_arrow, label: "200 run"),
                SizedBox(
                  width: 130,
                ),
                IconSection2(icon: Icons.menu_sharp),
              ],
            ),

            // Text Section
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextSection(label: "Christmas Poster"),
                  const SizedBox(height: 8.0),
                  TextSection1(
                      label:
                          "Create stunning images for products showcases, presentation & others."),
                  const SizedBox(height: 8.0),
                ],
              ),
            ),

            // Button Section
            ButtonSection(
              label: "Run Workflow",
              icon: Icons.arrow_forward,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WorkflowScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
