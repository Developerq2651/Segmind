import 'package:flutter/material.dart';
import 'package:try4/card/card.dart';
import 'package:try4/card/textxgip.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(children: [
        Container(
            margin: EdgeInsets.fromLTRB(4, 0, 4, 10),
            width: 370,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(
                    color: DefaultSelectionStyle.defaultColor, width: 2)),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search model',
                    // Label text color
                  ),
                  style: TextStyle(color: Colors.white), // Input text color
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
      ]))),
    );
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
