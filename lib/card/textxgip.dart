import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  final String label;

  const TagChip({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: const Color.fromARGB(255, 14, 13, 13),
      labelStyle: const TextStyle(color: Colors.white, fontSize: 12.0),
    );
  }
}
