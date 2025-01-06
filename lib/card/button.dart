import 'package:flutter/material.dart';

class ButtonSection extends StatelessWidget {
  final String label;
  final IconData? icon;
  final IconData? icon1;
  final VoidCallback onPressed;
  final double? width; // Add width parameter
  final double? height;
  final Color backgroundColor;
  const ButtonSection({
    required this.label,
    this.icon,
    this.icon1,
    required this.onPressed,
    this.width,
    this.height,
    this.backgroundColor = Colors.purple,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              minimumSize: Size(width ?? 0, height ?? 40),
            ),
            onPressed: onPressed,
            child: Row(
              children: [
                Icon(icon1),
                Text(
                  label,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(179, 255, 255, 255)),
                ),
                SizedBox(
                  width: 6,
                ),
                Icon(icon)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
