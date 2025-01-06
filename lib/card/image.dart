import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  final String imagePath;
  final double height;
  final double width;

  const ImageSection(
      {required this.imagePath,
      this.height = 180,
      this.width = 170,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.fromLTRB(15, 15, 5, 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
          bottomLeft: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
        ),
        image: DecorationImage(
          image: NetworkImage(imagePath), // Replace with your asset
          fit: BoxFit.cover,
          onError: (error, stackTrace) {
            debugPrint("Error loading network image: $error");
          },
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Image.network(
          imagePath,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
          errorBuilder: (context, error, stackTrace) {
            return const Center(child: Text('Error loading image'));
          },
        ),
      ),
    );
  }
}

class ImageSection2 extends StatelessWidget {
  final String imagePath;

  const ImageSection2({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: 150,
      margin: EdgeInsets.fromLTRB(5, 10, 10, 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
          bottomLeft: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
        ),
        image: DecorationImage(
          image: AssetImage(imagePath), // Replace with your asset
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
