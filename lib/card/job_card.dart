import 'package:flutter/material.dart';
import 'package:try4/card/button.dart';
import 'package:try4/card/icons.dart';
import 'package:try4/card/image.dart';
import 'package:try4/card/text.dart';
import 'package:try4/update.dart';

class JobCard extends StatelessWidget {
  const JobCard({super.key});

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
                  TextSection2(label: "Promt"),
                  const SizedBox(height: 8.0),
                  TextSection1(
                      label:
                          "Create stunning images for products showcases, presentation & others."),
                  const SizedBox(height: 8.0),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 170,
                  margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                      ),
                      border: Border.all(
                        color: const Color.fromARGB(
                            255, 202, 61, 33), // Set the border color here
                        width: 1.0, // Set the border width here
                      )),
                  child: Padding(
                      padding: EdgeInsets.all(3),
                      child: Row(
                        children: [
                          Icon(Icons.route),
                          Text(
                            "Product Showcase v1",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 11),
                          )
                        ],
                      )),
                )
              ],
            ),

            // Button Section
            ButtonSection(
              label: "Publish to community",
              icon: Icons.arrow_forward,
              onPressed: () => _showPublishBottomSheet(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showPublishBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      backgroundColor: Colors.grey[900],
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
            expand: false, // Allow the bottom sheet to expand fully
            initialChildSize: 0.8, // Initial size of the bottom sheet
            minChildSize: 0.3, // Minimum size of the bottom sheet

            builder: (BuildContext context, ScrollController scrollController) {
              return Stack(children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          child: IconButton(
                            icon: Icon(Icons.linear_scale, color: Colors.white),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            'Publish To Community',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(12, 10, 12, 5),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Colors.grey[800],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Promt",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Whether you’re creating videos for social media or designing invitations for an upcoming event, the application of graphic design is vast and versatile. From font pairing and scale, to alignment and white space, the facets of the design world are complex. Let these 26 epic design tips help you through the pits and the peaks of the creative process. shhdkhd",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            )),
                        ImageSection(
                          imagePath: "assets/image/christmas_image.png",
                          height: 300,
                          width: 400,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.grey[850],
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonSection(
                            label: "Publish to Community",
                            width: 330,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateScreen(),
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                ),
              ]);
            });
      },
    );
  }
}
