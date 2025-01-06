import 'package:flutter/material.dart';
import 'package:try4/card/button.dart';
import 'package:try4/card/icons.dart';
import 'package:try4/card/image.dart';
import 'package:try4/card/text.dart';
import 'package:try4/result.dart';

class WorkflowScreen extends StatefulWidget {
  const WorkflowScreen({super.key});

  @override
  State<WorkflowScreen> createState() => _WorkflowScreenState();
}

class _WorkflowScreenState extends State<WorkflowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        leading: InkWell(
          onTap: () {
            Navigator.pop(context); // Handle back navigation
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          SizedBox(
            width: 300,
          ),
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Container(
                      height: 20, // Customize height
                      width: 30,
                      alignment: Alignment.center,

                      child: Text(
                        'Updated',
                        style: TextStyle(fontSize: 16), // Customize text size
                      ),
                    ),
                    duration: Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Customize border radius
                    ),
                    margin: EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10), // Customize margin
                  ),
                );
              },
              icon: Icon(Icons.update))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconSection(icon: Icons.stars, label: "Flux 1.3"),
                SizedBox(
                  width: 7,
                ),
                IconSection1(icon: Icons.star, label: "GPT-4o"),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 27,
                      margin: EdgeInsets.all(10),
                      child:
                          TextSection(label: "Christmas Poster", fontSize: 25),
                    ),
                    Container(
                      width: 270,
                      margin: EdgeInsets.only(left: 10),
                      child: TextSection1(
                          label:
                              "Create stunning images for products showcases, presentation & others.",
                          fontSize: 15),
                    ),
                  ],
                ),
                InkWell(
                  child: ImageSection(
                    imagePath: 'assets/image/christmas_image.png',
                    height: 80,
                    width: 70,
                  ),
                  onTap: () {
                    _showWorkBottomSheet(context);
                  },
                )
              ],
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10, 28, 0, 0),
                child: Text(
                  "Type your brand",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
            Container(
              margin: EdgeInsets.fromLTRB(10, 3, 10, 1),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Example,Brand:Segmind",
                  labelStyle:
                      TextStyle(color: Colors.white), // Label text color
                ),
                style: TextStyle(color: Colors.white), // Input text color
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10, 28, 0, 0),
                child: Text(
                  "Promt",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
            Container(
              margin: EdgeInsets.fromLTRB(10, 3, 10, 1),
              child: TextField(
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Describe the style of the Poster. be specific :)",
                  labelStyle:
                      TextStyle(color: Colors.white), // Label text color
                ),
                style: TextStyle(color: Colors.white), // Input text color
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10, 28, 0, 0),
                child: Text(
                  "Reference Image",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
            Container(
              margin: EdgeInsets.fromLTRB(10, 3, 10, 0),
              width: 400, // Adjust the width to match the design
              height: 150, // Adjust the height to match the design
              decoration: BoxDecoration(
                color: Colors.grey[900],
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(
                    8.0), // Background color for the container
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.cloud_upload_outlined, // Cloud upload icon
                    size: 50,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Tap to upload image',
                    style: TextStyle(
                      color: Colors.grey[500], // Text color
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.grey[900], // Background color for the bottom bar
          // Define a fixed height for the BottomAppBar
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ButtonSection(
                label: "Run Workflow",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ResultScreen()));
                },
                width: 340,
              ),
            ],
          )),
    );
  }

  void _showWorkBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 4, 4, 4),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
            expand: false, // Allow the bottom sheet to expand fully
            initialChildSize: 0.8, // Initial size of the bottom sheet
            minChildSize: 0.3, // Minimum size of the bottom sheet

            builder: (BuildContext context, ScrollController scrollController) {
              return Stack(children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(bottom: 10),
                          child: IconButton(
                            icon: Icon(Icons.linear_scale, color: Colors.white),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            'Some Examples from your Community',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 380,
                          height: 400,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(color: Colors.black),
                                child: Column(
                                  children: [
                                    ImageSection(
                                      imagePath:
                                          "assets/image/christmas_image.png",
                                      width: 340,
                                      height: 330,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            alignment: Alignment.bottomLeft,
                                            margin: EdgeInsets.fromLTRB(
                                                23, 1, 5, 0),
                                            child: CircleAvatar(
                                              radius: 8,
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 255, 145, 0),
                                            )),
                                        Text(
                                          "Willy",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Container(
                                            margin: EdgeInsets.fromLTRB(
                                                100, 1, 10, 0),
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                child: Row(
                                                  children: [
                                                    Text("Use Template"),
                                                    Icon(Icons.arrow_forward)
                                                  ],
                                                )))
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]);
            });
      },
    );
  }
}
