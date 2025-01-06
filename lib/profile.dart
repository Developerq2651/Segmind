import 'package:flutter/material.dart';
import 'package:try4/card/button.dart';
import 'package:try4/card/text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 18, 5, 18),
            child: Row(
              children: [
                SizedBox(
                  width: 70,
                  child: Icon(
                    Icons.person_2_rounded,
                    size: 50,
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  TextSection(
                    label: "Doctor_who",
                    fontSize: 23,
                  ),
                  Text("Whoknowswhatwearedoing@gmail.com")
                ])
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 5, 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 190,
                      margin: EdgeInsets.fromLTRB(10, 10, 1, 18),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextSection(
                              label: "0.00",
                              fontSize: 26,
                            ),
                            Text(
                              "Credits Remaining",
                              style: TextStyle(fontSize: 16),
                            )
                          ]),
                    ),
                    ButtonSection(
                      label: "Add credits",
                      onPressed: () {},
                      height: 45,
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(
                16.0), // Add some padding around the content
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    // Background color for the card
                    border: Border.all(
                      color:
                          const Color.fromARGB(255, 36, 35, 35), // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(8.0), // Border radius
                  ),
                  child: Card(
                    // Use a Card for a better visual separation
                    color: Colors.black,
                    elevation: 1.0, // Add a slight shadow
                    shape: RoundedRectangleBorder(
                      // Add rounded corners
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.edit),
                          title: const Text('Edit profile'),
                          onTap: () {
                            // Handle edit profile tap
                          },
                        ),
                        const Divider(
                            height: 0), // Add a divider between the list tiles
                        ListTile(
                          leading: const Icon(Icons.swap_vert),
                          title: const Text('Transaction History'),
                          onTap: () {
                            // Handle transaction history tap
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.grey[900], // Background color for the bottom bar
          // Define a fixed height for the BottomAppBar
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ButtonSection(
                label: "Delete Account",
                onPressed: () {},
                width: 340,
              ),
            ],
          )),
    );
  }
}
