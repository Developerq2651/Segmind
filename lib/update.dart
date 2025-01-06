import 'package:flutter/material.dart';
import 'package:try4/card/button.dart';
import 'package:try4/card/card.dart';
import 'package:try4/card/image.dart';

import 'package:try4/community.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 90),
            width: 380,
            height: 300,
            alignment: Alignment.bottomCenter,
            child: ImageSection(
              imagePath: "assets/image/taskuploaded.png",
              height: 280,
              width: 300,
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Text(
              'Work published Successfully',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(13, 0, 12, 5),
            child: Text(
              'Create stunning images for products showcases, presentation & others.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 70,
            margin: EdgeInsets.fromLTRB(12, 1, 13, 0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: ButtonSection(
              label: "View in Community",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommunityScreen()),
                );
              },
              width: 340,
            ),
          ),
          Container(
            height: 43,
            width: 340,
            margin: EdgeInsets.fromLTRB(22, 1, 13, 0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey, width: 1),
                borderRadius: BorderRadius.circular(8)),
            child: ButtonSection(
              label: "Go Back to Model",
              onPressed: () => _showModelBottomSheet(context),
              width: 300,
              backgroundColor: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  void _showModelBottomSheet(BuildContext context) {
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
              return SingleChildScrollView(
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
                          'Choose your model to use the image',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(15, 0, 4, 0),
                          width: 370,
                          height: 100,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Search model',
                                    labelStyle: TextStyle(
                                        color:
                                            Colors.white), // Label text color
                                  ),
                                  style: TextStyle(
                                      color: Colors.white), // Input text color
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 6),
                                  width: 60,
                                  height: 50,
                                  color: const Color.fromARGB(66, 14, 13, 13),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.filter_alt_outlined),
                                    iconSize: 40,
                                  )),
                            ],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 4),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(
                                      255, 175, 171, 171), // Border color
                                  width: 1, // Border width
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child: Text(
                                  "Text-to-image",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )),
                          Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(
                                      255, 175, 171, 171), // Border color
                                  width: 1, // Border width
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child: Text(
                                  "Image-to-image",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )),
                          Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(
                                      255, 175, 171, 171), // Border color
                                  width: 1, // Border width
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child: Text(
                                  "video",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )),
                          Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(
                                      255, 175, 171, 171), // Border color
                                  width: 1, // Border width
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child: Text(
                                  "Photography",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ))
                        ],
                      ),
                      ListView.builder(
                        itemCount: 8, // Number of items in the list
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ChristmasPosterCard(
                            index: index,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
