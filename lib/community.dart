import 'package:flutter/material.dart';
import 'package:try4/flux.dart';
import 'package:try4/job.dart';
import 'package:try4/studio.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  List<Map<String, dynamic>> items = [
    {
      "username": "willy",
      "avatar": "https://via.placeholder.com/50",
      "images": [
        "https://via.placeholder.com/150",
        "https://via.placeholder.com/150",
        "https://via.placeholder.com/150",
      ],
      "likes": 23,
    },
    {
      "username": "user_123",
      "avatar": "https://via.placeholder.com/50",
      "images": ["https://via.placeholder.com/150"],
      "likes": 45,
    },
  ];

  // Simulate design update (add a new post)
  void addNewItem() {
    setState(() {
      items.add({
        "username": "new_user",
        "avatar": "https://via.placeholder.com/50",
        "images": [
          "https://neural.love/cdn/ai-photostock/1ed52309-37ec-698a-93b2-9312ccf38a09/0.jpg?Expires=1988150399&Signature=O2zOQA~dleDQjvd7hE~Z3i4rgYHLPAet-4mv9WL4iLYHyPWaZ3SImgoxPsZvBLK~n4N7PbK9Kd4p-YlNMzoyJOyT2567ZsEcrXzbP-d4AhrgN2R2ijdecfyzY13EsOHOfvHNzscXqi7NKsspSb72oUZxkKs9iWSd~~1OmelRuqYks9bNTHwkw2lkofeEBJEWbYf~~IxUqAy~pVa4LxcLxtyQ8nVk8soCKovnebdrH2ZD-zsmhYpqIvSlbnkLnrYtgVQRpylqn0KUo7vOKxed07Jlo20XgtdVeQZCig5uqHUng1KpRCW9bnmDbB1twHRKGbnBZMXpW~RDplKy5ZZqkg__&Key-Pair-Id=K2RFTOXRBNSROX"
        ],
        "likes": 10,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Community", style: TextStyle(color: Colors.white)),
          actions: [
            IconButton(
              icon: Icon(Icons.grid_view, color: Colors.purple),
              onPressed: () {}, // Add functionality to toggle views
            ),
            IconButton(
              icon: Icon(Icons.list, color: Colors.white),
              onPressed: () {}, // Add functionality to toggle views
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two cards per row
                  crossAxisSpacing: 8.0, // Spacing between cards horizontally
                  mainAxisSpacing: 8.0, // Spacing between cards vertically
                  childAspectRatio: 0.75, // Adjust to change card size ratio
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final images = item['images'];
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImageShowcaseScreen()),
                        );
                      },
                      child: Card(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Image Grid or Single Image Handling
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  final gridWidth = constraints.maxWidth;

                                  // If there is only one image, make it take all available space
                                  if (images.length == 1) {
                                    return SizedBox(
                                      width: gridWidth,
                                      height: gridWidth *
                                          1, // Make the image take most of the space
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          images[0],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  }
                                  if (images.length % 2 == 0) {
                                    final imageSize =
                                        (gridWidth - 8.0) / 2; // Two columns
                                    return Wrap(
                                      spacing: 4.0,
                                      runSpacing: 4.0,
                                      children: List.generate(images.length,
                                          (imgIndex) {
                                        return SizedBox(
                                          width: imageSize,
                                          height: gridWidth * 1,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              images[imgIndex],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      }),
                                    );
                                  }

                                  // Otherwise, handle multiple images
                                  final imageSize = (gridWidth - 8.0) / 2;
                                  // Two columns

                                  return Wrap(
                                    spacing: 8.0,
                                    runSpacing: 4.0,
                                    children: List.generate(images.length,
                                        (imgIndex) {
                                      final isLastImage =
                                          (images.length % 2 != 0) &&
                                              (imgIndex == images.length - 1);
                                      final isSingleImage = images.length == 1;

                                      return SizedBox(
                                        width: isSingleImage || isLastImage
                                            ? gridWidth // Full width for single image or last odd image
                                            : imageSize, // Half width for others
                                        height: isSingleImage || isLastImage
                                            ? gridWidth *
                                                0.5 // Dynamic height for single or odd last image
                                            : imageSize, // Square aspect ratio for others
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            images[imgIndex],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),

                              // Username and Likes Row
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(item['avatar']),
                                    ),
                                    SizedBox(width: 8.0),
                                    Text(
                                      item['username'],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          item['likes']++;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Icon(Icons.favorite,
                                              color: Colors.red),
                                          SizedBox(width: 4.0),
                                          Text(
                                            item['likes'].toString(),
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
          onPressed: addNewItem,
          child: Icon(Icons.add, color: Colors.white),
        ),
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
          currentIndex: 2,
          selectedItemColor: Colors.amber[800],
          onTap: (index) {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Studio()),
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const JobScreen()),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CommunityScreen()),
              );
            }
          },
        ));
  }
}
