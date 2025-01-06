import 'package:flutter/material.dart';
import 'package:try4/card/job_card.dart';

import 'package:try4/community.dart';
import 'package:try4/studio.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({super.key});

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
                SizedBox(width: 220),
                Icon(Icons.image)
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(4, 20, 4, 0),
              width: 400,
              height: 50,
              color: Colors.black26,
              child: Row(
                children: [
                  SizedBox(
                    width: 200, // Specify the width for the Text widget
                    child: Text(
                      "Your Job",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                      maxLines: 2, // Allow text to span up to 2 lines
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )),
          ListView.builder(
            itemCount: 8, // Number of items in the list
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return JobCard();
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
          currentIndex: 1,
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
                MaterialPageRoute(builder: (context) => CommunityScreen()),
              );
            }
          },
        ));
  }
}
