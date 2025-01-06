import 'package:flutter/material.dart';
import 'package:try4/card/button.dart';
import 'package:try4/card/icons.dart';
import 'package:try4/card/image.dart';
import 'package:try4/card/text.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:try4/models/inferencemodel.dart';

import 'package:try4/workflow/work_flow.dart';

import 'textxgip.dart';

class ChristmasPosterCard extends StatefulWidget {
  final int? index; // Make index nullable

  const ChristmasPosterCard({
    super.key,
    this.index, // Remove required
  });

  @override
  _ChristmasPosterCardState createState() => _ChristmasPosterCardState();
}

class _ChristmasPosterCardState extends State<ChristmasPosterCard> {
  List<InferenceDetails> dataList = [];
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    getPostApi(); // Call API when widget initializes
  }

  Future<void> getPostApi() async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.spotprod.segmind.com/inference-model-information/list?segmind_model=True'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        final list =
            data["Inference Segmind Model Information List With Details"];
        if (list != null) {
          final filteredList = (list as List)
              .map((item) => InferenceDetails.fromJson(item))
              .where((item) {
            if (item.thumbnailImage != null) {
              return true;
            }
            return item.defaultImageOutput != null;
          }).toList();

          setState(() {
            dataList = filteredList;
            isLoading = false;
          });
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (dataList.isEmpty ||
        widget.index == null ||
        dataList[widget.index!].parameters!.metadata!.isEmpty) {
      return const SizedBox.shrink(); // Or show placeholder/message
    }
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(221, 51, 48, 48),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                if (isLoading)
                  const Center(child: CircularProgressIndicator())
                else if (dataList.isEmpty ||
                    widget.index == null ||
                    widget.index! >= dataList.length)
                  const Center(child: Text('No data available'))
                else
                  ImageSection(
                    imagePath: dataList[widget.index!].thumbnailImage ??
                        dataList[widget.index!].defaultImageOutput ??
                        "",
                    height: 280,
                    width: 340,
                    // Add a height constraint
                  ),
              ],
            )
            // Image Section
            ,
            Row(
              children: [
                IconSection(icon: Icons.stars, label: "Flux 1.3"),
                SizedBox(
                  width: 7,
                ),
                IconSection1(icon: Icons.play_arrow, label: "200 run"),
                SizedBox(
                  width: 130,
                ),
                IconSection2(icon: Icons.menu_sharp),
              ],
            ),

            // Text Section
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isLoading &&
                      widget.index != null &&
                      widget.index! < dataList.length)
                    TextSection(
                      label: (dataList[widget.index!].title ?? '') +
                          (" ") +
                          (dataList[widget.index!].type ?? ""),
                    ),
                  const SizedBox(height: 8.0),
                  TextSection1(
                      label: (!isLoading &&
                              widget.index != null &&
                              widget.index! < dataList.length)
                          ? (dataList[widget.index!].description ?? "")
                          : ""),
                  const SizedBox(height: 8.0),
                  Wrap(
                    spacing: 6.0,
                    children: [
                      TagChip(label: '#image-to-image'),
                      TagChip(label: '#text-to-image'),
                      TagChip(label: '#Video'),
                      TagChip(label: '#photography'),
                    ],
                  ),
                ],
              ),
            ),

            // Button Section
            ButtonSection(
              label: "Run Workflow",
              icon: Icons.arrow_forward,
              onPressed: () {
                final data =
                    dataList.isNotEmpty ? dataList[widget.index!] : null;
                if (data != null) {
                  _handleCardTap(data);
                } else {
                  print("NO DATA");
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handleCardTap(InferenceDetails details) {
    if (widget.index == null || widget.index! >= dataList.length) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkflowForm(
          details: details,
          onSubmit: (formData) {
            print(formData);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
