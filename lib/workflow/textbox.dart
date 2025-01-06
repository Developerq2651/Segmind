import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget buildTextBox({
  required String key,
  required String label,
  dynamic displayvalue,
  required bool isRequired,
  String? description,
  String? type,
}) {
  bool isImageUrl = displayvalue != null &&
      (displayvalue.toString().startsWith('http') ||
          displayvalue.toString().startsWith('https')) &&
      (displayvalue.toString().endsWith('.jpg') ||
          displayvalue.toString().endsWith('.png') ||
          displayvalue.toString().endsWith('.jpeg'));

  return Container(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty)
          Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        if (description != null)
          Text(
            description,
            style: TextStyle(color: Colors.grey[400], fontSize: 12),
          ),
        const SizedBox(height: 8),
        if (isImageUrl)
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: CachedNetworkImage(
              imageUrl: displayvalue is String ? displayvalue : '',
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.broken_image, color: Colors.grey[600]),
                    const SizedBox(height: 8),
                    const Text('Failed to load image'),
                  ],
                ),
              ),
            ),
          ),
      ],
    ),
  );
}
