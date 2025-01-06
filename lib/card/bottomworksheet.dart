import 'package:flutter/material.dart';
import 'package:try4/card/image.dart';

class Bottomwork extends StatefulWidget {
  const Bottomwork({super.key});

  @override
  State<Bottomwork> createState() => _BottomworkState();
}

class _BottomworkState extends State<Bottomwork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: 380,
            height: 400,
            child: Column(
              children: [
                ImageSection(
                  imagePath: "assets/image/christmas_image.png",
                  width: 340,
                  height: 320,
                ),
                Row(
                  children: [
                    Container(
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.only(right: 5),
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor:
                              const Color.fromARGB(255, 255, 145, 0),
                        )),
                    Text("Willy"),
                    Container(
                      alignment: Alignment.bottomRight,
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Icon(
              Icons.star,
              color: Colors.yellow,
              size: 40,
            ),
          )
        ],
      ),
    );
  }
}
