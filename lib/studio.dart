import 'package:flutter/material.dart';
import 'package:try4/card/card.dart';
import 'package:try4/card/textxgip.dart';
import 'package:try4/community.dart';

import 'package:try4/profile.dart';
import 'package:try4/save_workflow.dart';
import 'package:try4/search.dart';

import 'job.dart';

class Studio extends StatefulWidget {
  const Studio({super.key});

  @override
  _StudioState createState() => _StudioState();
}

class _StudioState extends State<Studio> {
  bool _isNavigating = false;

  void _handleNavigation(BuildContext context, Widget screen) async {
    if (_isNavigating) return;
    setState(() {
      _isNavigating = true;
    });
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
    setState(() {
      _isNavigating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(4, 60, 4, 0),
            width: 400,
            height: 50,
            color: Colors.black26,
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.purpleAccent,
                ),
                SizedBox(width: 5),
                Text(
                  "Segmind",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 232, 231, 228),
                      fontSize: 21,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 200),
                IconButton(
                    onPressed: () =>
                        _handleNavigation(context, ProfileScreen()),
                    icon: Icon(Icons.person_2_rounded))
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(4, 20, 4, 0),
              width: 400,
              height: 100,
              color: Colors.black26,
              child: Row(
                children: [
                  SizedBox(
                    width: 200, // Specify the width for the Text widget
                    child: Text(
                      "Bring your ideas to life",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                      maxLines: 2, // Allow text to span up to 2 lines
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 90),
                  Center(child: Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: () =>
                            _handleNavigation(context, const SavedWorkflow()),
                        child: Icon(
                          Icons.save_rounded,
                          size: 40,
                        ),
                      );
                    },
                  )),
                  Icon(
                    Icons.list_alt,
                    size: 40,
                  ),
                ],
              )),
          Container(
              margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
              width: 370,
              height: 100,
              color: const Color.fromARGB(66, 26, 25, 25),
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Search model',
                        labelStyle:
                            TextStyle(color: Colors.white), // Label text color
                      ),
                      style: TextStyle(color: Colors.white), // Input text color
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchScreen()),
                      );
                    },
                  )),
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 60,
                      height: 50,
                      color: const Color.fromARGB(66, 14, 13, 13),
                      child: IconButton(
                        onPressed: () => showFilterBottomSheet(context),
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
          Container(
            margin: EdgeInsets.fromLTRB(1, 20, 0, 1),
            child: Row(children: [
              Text("Workflows(54)",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
            ]),
          ),
          ListView.builder(
            itemCount: 200,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ChristmasPosterCard(
                index: index < 200 ? index : null,
              );
            },
          ),
        ])),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: 0,
          selectedItemColor: Colors.amber[800],
          onTap: (index) {
            if (index == 0) {
              _handleNavigation(context, Studio());
            } else if (index == 1) {
              _handleNavigation(context, const JobScreen());
            } else if (index == 2) {
              _handleNavigation(context, CommunityScreen());
            }
          },
        ));
  }

  void showFilterBottomSheet(BuildContext context) {
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
            initialChildSize: 0.5, // Initial size of the bottom sheet
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
                          'Filter by',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(12, 20, 0, 5),
                          child: Text(
                            "Popularity",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                          12,
                          3,
                          12,
                          5,
                        ),
                        child: DropdownButtonFormField<String>(
                          dropdownColor: Colors.grey[900],
                          value: "Most popular",
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[850],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                          icon:
                              Icon(Icons.arrow_drop_down, color: Colors.white),
                          items: <String>[
                            "Most popular",
                            "image-to-image",
                            "text-to-image",
                            "Video",
                            "photography",
                            "Control-net",
                            "cartoon",
                            "Audio",
                            "inpainting",
                            "e-commerce",
                            "ad-shoot"
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            // Handle dropdown selection
                          },
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(12, 20, 0, 5),
                          child: Text(
                            "Categories",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                      Container(
                        margin: EdgeInsets.fromLTRB(12, 00, 12, 5),
                        child: Wrap(
                          spacing: 3.0,
                          children: [
                            TagChip(label: 'image-to-image'),
                            TagChip(label: 'text-to-image'),
                            TagChip(label: 'Video'),
                            TagChip(label: 'photography'),
                            TagChip(label: 'Control-net'),
                            TagChip(label: 'cartoon'),
                            TagChip(label: 'Audio'),
                            TagChip(label: 'inpainting'),
                            TagChip(label: 'e-commerce'),
                            TagChip(label: 'ad-shoot'),
                          ],
                        ),
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
