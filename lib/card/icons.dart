import 'package:flutter/material.dart';

class IconSection extends StatelessWidget {
  final IconData icon;
  final String? label;
  final Color borderColor;
  final double iconSize;
  final double width;
  final double height;

  const IconSection({
    required this.icon,
    this.label,
    this.borderColor = Colors.grey,
    this.iconSize = 18.0,
    this.height = 25,
    this.width = 80,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              border: Border.all(
                color: borderColor, // Border color
                width: 1, // Border width
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
            ),
            margin: EdgeInsets.fromLTRB(18, 10, 0, 0),
            child: Padding(
                padding: EdgeInsets.all(2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: iconSize),
                    label != null
                        ? Text(
                            label!,
                            style: TextStyle(fontSize: 12),
                          )
                        : Container()
                  ],
                ))),
      ],
    );
  }
}

class IconSection1 extends StatelessWidget {
  final IconData icon;
  final String? label;

  final double iconSize;
  final double width;
  final double height;

  const IconSection1({
    required this.icon,
    this.label,
    this.iconSize = 18.0,
    this.height = 25,
    this.width = 80,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 175, 171, 171), // Border color
                width: 1, // Border width
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
            ),
            margin: EdgeInsets.only(top: 10),
            child: Padding(
                padding: EdgeInsets.all(2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      size: iconSize,
                    ),
                    label != null
                        ? Text(
                            label!,
                            style: TextStyle(fontSize: 12),
                          )
                        : Container()
                  ],
                ))),
      ],
    );
  }
}

class IconSection2 extends StatelessWidget {
  final IconData icon;
  final double iconSize;

  const IconSection2({
    required this.icon,
    this.iconSize = 18.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Icon(
                icon,
                size: iconSize,
              )
            ],
          ),
        ),
      ],
    );
  }
}
