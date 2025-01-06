import 'dart:convert';
import 'package:http/http.dart' as http;

class ImageGenerationService {
  final String baseUrl = 'https://api.spotprod.segmind.com';

  Future<Map<String, dynamic>> getBaseImageDetails() async {
    try {
      final response = await http.get(
        Uri.parse(
            '$baseUrl/inference-model-information/list?segmind_model=True'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return {
          'models': data['models'],
          'base_images':
              data['models'].map((model) => model['base_image']).toList(),
          'titles': data['models'].map((model) => model['title']).toList(),
          'descriptions':
              data['models'].map((model) => model['description']).toList() ??
                  [],
        };
      } else {
        throw Exception(
            'Failed to fetch base image details: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching base image details: $e');
    }
  }
}
