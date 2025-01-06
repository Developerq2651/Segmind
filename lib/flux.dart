import 'package:flutter/material.dart';
import 'package:try4/card/icons.dart';

class ImageShowcaseScreen extends StatelessWidget {
  final List<ImageData> imageDataList = [
    ImageData(
      imageUrl:
          'https://i.stack.imgur.com/gSAYp.png', // Replace with actual URLs
      prompt:
          'Create stunning images for products showcases, presentation & others',
      author: 'willy',
    ),
    ImageData(
      imageUrl:
          'https://neural.love/cdn/ai-photostock/1ed52309-37ec-698a-93b2-9312ccf38a09/0.jpg?Expires=1988150399&Signature=O2zOQA~dleDQjvd7hE~Z3i4rgYHLPAet-4mv9WL4iLYHyPWaZ3SImgoxPsZvBLK~n4N7PbK9Kd4p-YlNMzoyJOyT2567ZsEcrXzbP-d4AhrgN2R2ijdecfyzY13EsOHOfvHNzscXqi7NKsspSb72oUZxkKs9iWSd~~1OmelRuqYks9bNTHwkw2lkofeEBJEWbYf~~IxUqAy~pVa4LxcLxtyQ8nVk8soCKovnebdrH2ZD-zsmhYpqIvSlbnkLnrYtgVQRpylqn0KUo7vOKxed07Jlo20XgtdVeQZCig5uqHUng1KpRCW9bnmDbB1twHRKGbnBZMXpW~RDplKy5ZZqkg__&Key-Pair-Id=K2RFTOXRBNSROX', // Replace with actual URLs
      prompt: 'Another prompt example',
      author: 'willy',
    ),
    ImageData(
      imageUrl:
          'https://neural.love/cdn/ai-photostock/1ed52309-37ec-698a-93b2-9312ccf38a09/0.jpg?Expires=1988150399&Signature=O2zOQA~dleDQjvd7hE~Z3i4rgYHLPAet-4mv9WL4iLYHyPWaZ3SImgoxPsZvBLK~n4N7PbK9Kd4p-YlNMzoyJOyT2567ZsEcrXzbP-d4AhrgN2R2ijdecfyzY13EsOHOfvHNzscXqi7NKsspSb72oUZxkKs9iWSd~~1OmelRuqYks9bNTHwkw2lkofeEBJEWbYf~~IxUqAy~pVa4LxcLxtyQ8nVk8soCKovnebdrH2ZD-zsmhYpqIvSlbnkLnrYtgVQRpylqn0KUo7vOKxed07Jlo20XgtdVeQZCig5uqHUng1KpRCW9bnmDbB1twHRKGbnBZMXpW~RDplKy5ZZqkg__&Key-Pair-Id=K2RFTOXRBNSROX', // Replace with actual URLs
      prompt: 'Another prompt example',
      author: 'willy',
    ),
    ImageData(
      imageUrl:
          'https://neural.love/cdn/ai-photostock/1ed52309-37ec-698a-93b2-9312ccf38a09/0.jpg?Expires=1988150399&Signature=O2zOQA~dleDQjvd7hE~Z3i4rgYHLPAet-4mv9WL4iLYHyPWaZ3SImgoxPsZvBLK~n4N7PbK9Kd4p-YlNMzoyJOyT2567ZsEcrXzbP-d4AhrgN2R2ijdecfyzY13EsOHOfvHNzscXqi7NKsspSb72oUZxkKs9iWSd~~1OmelRuqYks9bNTHwkw2lkofeEBJEWbYf~~IxUqAy~pVa4LxcLxtyQ8nVk8soCKovnebdrH2ZD-zsmhYpqIvSlbnkLnrYtgVQRpylqn0KUo7vOKxed07Jlo20XgtdVeQZCig5uqHUng1KpRCW9bnmDbB1twHRKGbnBZMXpW~RDplKy5ZZqkg__&Key-Pair-Id=K2RFTOXRBNSROX', // Replace with actual URLs
      prompt: 'Another prompt example',
      author: 'willy',
    ),
    ImageData(
      imageUrl:
          'https://neural.love/cdn/ai-photostock/1ed52309-37ec-698a-93b2-9312ccf38a09/0.jpg?Expires=1988150399&Signature=O2zOQA~dleDQjvd7hE~Z3i4rgYHLPAet-4mv9WL4iLYHyPWaZ3SImgoxPsZvBLK~n4N7PbK9Kd4p-YlNMzoyJOyT2567ZsEcrXzbP-d4AhrgN2R2ijdecfyzY13EsOHOfvHNzscXqi7NKsspSb72oUZxkKs9iWSd~~1OmelRuqYks9bNTHwkw2lkofeEBJEWbYf~~IxUqAy~pVa4LxcLxtyQ8nVk8soCKovnebdrH2ZD-zsmhYpqIvSlbnkLnrYtgVQRpylqn0KUo7vOKxed07Jlo20XgtdVeQZCig5uqHUng1KpRCW9bnmDbB1twHRKGbnBZMXpW~RDplKy5ZZqkg__&Key-Pair-Id=K2RFTOXRBNSROX', // Replace with actual URLs
      prompt: 'Another prompt example',
      author: 'willy',
    ),
    ImageData(
      imageUrl:
          'https://neural.love/cdn/ai-photostock/1ed52309-37ec-698a-93b2-9312ccf38a09/0.jpg?Expires=1988150399&Signature=O2zOQA~dleDQjvd7hE~Z3i4rgYHLPAet-4mv9WL4iLYHyPWaZ3SImgoxPsZvBLK~n4N7PbK9Kd4p-YlNMzoyJOyT2567ZsEcrXzbP-d4AhrgN2R2ijdecfyzY13EsOHOfvHNzscXqi7NKsspSb72oUZxkKs9iWSd~~1OmelRuqYks9bNTHwkw2lkofeEBJEWbYf~~IxUqAy~pVa4LxcLxtyQ8nVk8soCKovnebdrH2ZD-zsmhYpqIvSlbnkLnrYtgVQRpylqn0KUo7vOKxed07Jlo20XgtdVeQZCig5uqHUng1KpRCW9bnmDbB1twHRKGbnBZMXpW~RDplKy5ZZqkg__&Key-Pair-Id=K2RFTOXRBNSROX', // Replace with actual URLs
      prompt: 'Another prompt example',
      author: 'willy',
    ),
    ImageData(
      imageUrl:
          'https://neural.love/cdn/ai-photostock/1ed52309-37ec-698a-93b2-9312ccf38a09/0.jpg?Expires=1988150399&Signature=O2zOQA~dleDQjvd7hE~Z3i4rgYHLPAet-4mv9WL4iLYHyPWaZ3SImgoxPsZvBLK~n4N7PbK9Kd4p-YlNMzoyJOyT2567ZsEcrXzbP-d4AhrgN2R2ijdecfyzY13EsOHOfvHNzscXqi7NKsspSb72oUZxkKs9iWSd~~1OmelRuqYks9bNTHwkw2lkofeEBJEWbYf~~IxUqAy~pVa4LxcLxtyQ8nVk8soCKovnebdrH2ZD-zsmhYpqIvSlbnkLnrYtgVQRpylqn0KUo7vOKxed07Jlo20XgtdVeQZCig5uqHUng1KpRCW9bnmDbB1twHRKGbnBZMXpW~RDplKy5ZZqkg__&Key-Pair-Id=K2RFTOXRBNSROX', // Replace with actual URLs
      prompt: 'Another prompt example',
      author: 'willy',
    ),
    ImageData(
      imageUrl:
          'https://neural.love/cdn/ai-photostock/1ed52309-37ec-698a-93b2-9312ccf38a09/0.jpg?Expires=1988150399&Signature=O2zOQA~dleDQjvd7hE~Z3i4rgYHLPAet-4mv9WL4iLYHyPWaZ3SImgoxPsZvBLK~n4N7PbK9Kd4p-YlNMzoyJOyT2567ZsEcrXzbP-d4AhrgN2R2ijdecfyzY13EsOHOfvHNzscXqi7NKsspSb72oUZxkKs9iWSd~~1OmelRuqYks9bNTHwkw2lkofeEBJEWbYf~~IxUqAy~pVa4LxcLxtyQ8nVk8soCKovnebdrH2ZD-zsmhYpqIvSlbnkLnrYtgVQRpylqn0KUo7vOKxed07Jlo20XgtdVeQZCig5uqHUng1KpRCW9bnmDbB1twHRKGbnBZMXpW~RDplKy5ZZqkg__&Key-Pair-Id=K2RFTOXRBNSROX', // Replace with actual URLs
      prompt: 'Another prompt example',
      author: 'willy',
    ),
    ImageData(
      imageUrl:
          'https://neural.love/cdn/ai-photostock/1ed52309-37ec-698a-93b2-9312ccf38a09/0.jpg?Expires=1988150399&Signature=O2zOQA~dleDQjvd7hE~Z3i4rgYHLPAet-4mv9WL4iLYHyPWaZ3SImgoxPsZvBLK~n4N7PbK9Kd4p-YlNMzoyJOyT2567ZsEcrXzbP-d4AhrgN2R2ijdecfyzY13EsOHOfvHNzscXqi7NKsspSb72oUZxkKs9iWSd~~1OmelRuqYks9bNTHwkw2lkofeEBJEWbYf~~IxUqAy~pVa4LxcLxtyQ8nVk8soCKovnebdrH2ZD-zsmhYpqIvSlbnkLnrYtgVQRpylqn0KUo7vOKxed07Jlo20XgtdVeQZCig5uqHUng1KpRCW9bnmDbB1twHRKGbnBZMXpW~RDplKy5ZZqkg__&Key-Pair-Id=K2RFTOXRBNSROX', // Replace with actual URLs
      prompt: 'Another prompt example',
      author: 'willy',
    ),
    // Add more ImageData objects as needed
  ];

  ImageShowcaseScreen({super.key});

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
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  IconSection(
                    icon: Icons.stars,
                    label: "Flux 1.3",
                    borderColor: Colors.grey,
                    iconSize: 17,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(15, 10, 0, 5),
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor:
                                const Color.fromARGB(255, 255, 145, 0),
                          )),
                      SizedBox(width: 8),
                      Text('By ${imageDataList[0].author}',
                          style: TextStyle(color: Colors.white, fontSize: 27)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(17, 10, 17, 5),
                      width: 400,
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Promt",
                              style: TextStyle(fontSize: 10),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: 300,
                                    height: 30,
                                    child: Text(
                                      'By ${imageDataList[0].prompt}',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                    )),
                                Icon(Icons.copy)
                              ],
                            )
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: imageDataList.length,
                    itemBuilder: (context, index) {
                      return ImageCard(imageData: imageDataList[index]);
                    },
                  ),

                  SizedBox(height: 80), // Add some space at the bottom
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.grey[900], // Background color for the sticky row
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.favorite_border, color: Colors.white),
                        SizedBox(width: 8),
                        Text("23", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text("Recreate with Flux"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageData {
  final String imageUrl;
  final String prompt;
  final String author;

  ImageData(
      {required this.imageUrl, required this.prompt, required this.author});
}

class ImageCard extends StatelessWidget {
  final ImageData imageData;

  const ImageCard({super.key, required this.imageData});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[800],
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Stack(
        // Use Stack to overlay widgets
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageData.imageUrl,
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, object, stackTrace) => Center(
                    child: Text('Error loading image',
                        style: TextStyle(color: Colors.red))),
              ),
              // Space for buttons to be visible
            ],
          ),
          Positioned(
            // Position the buttons on top of the image
            bottom: 8,
            right: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                  onPressed: () {
                    /* ... */
                  },
                  icon: Icon(Icons.image, size: 16),
                  label:
                      Text('Use as reference', style: TextStyle(fontSize: 12)),
                ),
                SizedBox(width: 8),
                Icon(Icons.download, color: Colors.white, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
