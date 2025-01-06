import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showFilterBottomSheet(context),
          child: Text('Show Filter Options'),
        ),
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      backgroundColor: Colors.grey[900],
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Filter Options',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              ListTile(
                leading: Icon(Icons.filter_list, color: Colors.white),
                title: Text('Option 1', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Handle option 1 tap
                },
              ),
              ListTile(
                leading: Icon(Icons.filter_list, color: Colors.white),
                title: Text('Option 2', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Handle option 2 tap
                },
              ),
              ListTile(
                leading: Icon(Icons.filter_list, color: Colors.white),
                title: Text('Option 3', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Handle option 3 tap
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
