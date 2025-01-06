import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  final String label;
  final double fontSize;

  const TextSection({required this.label, this.fontSize = 20.0, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}

class TextSection1 extends StatelessWidget {
  final String label;
  final double fontSize;

  const TextSection1({required this.label, this.fontSize = 14, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(label,
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.grey,
        ));
  }
}

class TextSection2 extends StatelessWidget {
  final String label;

  const TextSection2({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(label,
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ));
  }
}
