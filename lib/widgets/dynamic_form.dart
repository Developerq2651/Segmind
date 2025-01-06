import 'package:flutter/material.dart';
import 'package:try4/card/button.dart';
import 'package:try4/models/inferencemodel.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';

class DynamicFormWidget extends StatefulWidget {
  final InferenceDetails details;
  final Function(Map<String, dynamic>) onSubmit;

  const DynamicFormWidget({
    required this.details,
    required this.onSubmit,
    super.key,
    required Map<String, dynamic> parameters,
  });

  @override
  State<DynamicFormWidget> createState() => _DynamicFormWidgetState();
}

class _DynamicFormWidgetState extends State<DynamicFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};

  // ignore: unused_element
  Widget _buildParameterField(String key, Map<String, dynamic> paramData) {
    final type = paramData['type'];
    final label = paramData['label'] ?? key;
    final defaultValue = paramData['displayValue'] ?? paramData['default'];
    final isRequired = paramData['required'] ?? false;
    if (type == 'image' ||
        ['image', 'mask', 'baseImage', 'overlayImage', 'controlImage']
            .contains(key)) {
      return _buildImageInput(key, label, isRequired);
    }

    // Numeric parameters
    if (['steps', 'seed', 'guidance', 'strength', 'samples', 'width', 'height']
        .contains(key)) {
      return _buildNumericInput(key, label, defaultValue, isRequired);
    }

    // Selection parameters
    if (['imageFormat', 'aspectRatio', 'sampler', 'scheduler'].contains(key)) {
      return _buildDropdownInput(
          key, label, defaultValue, paramData['options'] ?? []);
    }

    // Boolean parameters
    if (['usePromptEnhancer', 'maintainAspectRatio', 'cropToFit']
        .contains(key)) {
      return _buildSwitchInput(key, label, defaultValue ?? false);
    }

    switch (type) {
      case 'str':
      case 'prompt':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 28, 0, 0),
              child: Text(label,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 3, 10, 1),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[850],
                  border: OutlineInputBorder(),
                  hintText: paramData['description'] ?? '',
                ),
                initialValue: defaultValue?.toString(),
                validator: isRequired
                    ? (v) => v?.isEmpty ?? true ? 'Required' : null
                    : null,
                onSaved: (v) => _formData[key] = v,
              ),
            ),
          ],
        );

      case 'number':
      case 'float':
        final min = paramData['range']?[0] ?? 0.0;
        final max = paramData['range']?[1] ?? 100.0;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 28, 0, 0),
              child: Text(label,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            Slider(
              value: (_formData[key] ?? defaultValue ?? min).toDouble(),
              min: min.toDouble(),
              max: max.toDouble(),
              divisions: ((max - min) * 10).toInt(),
              label: _formData[key]?.toString() ?? defaultValue?.toString(),
              onChanged: (v) => setState(() => _formData[key] = v),
            ),
          ],
        );

      case 'image':
        final baseImageUrl = widget.details.defaultImageOutput ?? "";
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 28, 0, 0),
              child: Text(label,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Image.network(
                widget.details.defaultImageOutput ?? "",
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 3, 10, 0),
              width: 400,
              height: 150,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 151, 70, 70),
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: baseImageUrl.isNotEmpty
                  ? Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            widget.details.defaultImageOutput ?? "",
                            width: 180,
                            height: 170,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Center(
                              child: Icon(Icons.broken_image,
                                  color: Colors.white54, size: 50),
                            ),
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          right: 8,
                          top: 8,
                          child: IconButton(
                            icon: Icon(Icons.edit, color: Colors.white),
                            onPressed: () {
                              // Image upload logic
                            },
                          ),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.cloud_upload_outlined,
                            size: 50, color: Colors.white),
                        SizedBox(height: 20),
                        Text('Tap to upload image',
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 16)),
                      ],
                    ),
            ),
          ],
        );

      case 'boolean':
        return Container(
          margin: EdgeInsets.fromLTRB(10, 28, 10, 0),
          child: SwitchListTile(
            title: Text(label, style: TextStyle(color: Colors.white)),
            value: _formData[key] ?? defaultValue ?? false,
            onChanged: (v) => setState(() => _formData[key] = v),
          ),
        );

      default:
        return SizedBox.shrink();
    }
  }

  Widget _buildImageDisplay(String imagePath) {
    if (imagePath.startsWith('http')) {
      // Network image
      return CachedNetworkImage(
        imageUrl: imagePath,
        fit: BoxFit.contain,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );
    } else {
      // Local file
      return Image.file(
        File(imagePath),
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image),
      );
    }
  }

  Widget _buildImageInput(String key, String label, bool isRequired) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Container(
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: _formData[key] != null
                ? Stack(
                    children: [
                      Center(
                        child: _buildImageDisplay(_formData[key]),
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: IconButton(
                          icon: Icon(Icons.close, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              _formData[key] = null;
                            });
                          },
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.add_photo_alternate,
                              color: Colors.white, size: 32),
                          onPressed: () async {
                            final pickedFile = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (pickedFile != null) {
                              setState(() {
                                _formData[key] = pickedFile.path;
                              });
                            }
                          },
                        ),
                        if (isRequired)
                          Text(
                            '* Required',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumericInput(
      String key, String label, dynamic defaultValue, bool isRequired) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(10, 28, 0, 0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 3, 10, 1),
          child: TextFormField(
            initialValue: defaultValue?.toString(),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.grey[800],
              errorStyle: TextStyle(color: Colors.redAccent),
            ),
            validator: (value) {
              if (isRequired && (value == null || value.isEmpty)) {
                return 'This field is required';
              }
              if (value != null && double.tryParse(value) == null) {
                return 'Please enter a valid number';
              }
              return null;
            },
            onSaved: (value) {
              _formData[key] = double.tryParse(value ?? '');
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownInput(
      String key, String label, dynamic defaultValue, List<dynamic> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(10, 28, 0, 0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 3, 10, 1),
          child: DropdownButtonFormField<String>(
            value: defaultValue?.toString(),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.grey[800],
            ),
            dropdownColor: Colors.grey[800],
            style: TextStyle(color: Colors.white),
            items: options
                .map((option) => DropdownMenuItem<String>(
                      value: option.toString(),
                      child: Text(
                        option.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _formData[key] = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSwitchInput(String key, String label, bool defaultValue) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 28, 10, 1),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(4),
      ),
      child: SwitchListTile(
        title: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        value: _formData[key] ?? defaultValue,
        activeColor: Theme.of(context).primaryColor,
        onChanged: (bool value) {
          setState(() {
            _formData[key] = value;
          });
        },
      ),
    );
  }

  List<Widget> _buildAvailableParameters() {
    final parameters = widget.details.parameters;
    if (parameters == null) return [];

    final fields = <Widget>[];

    return fields;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text(widget.details.title ?? 'Create New',
            style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildAvailableParameters(),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[900],
        child: ButtonSection(
          label: "Generate",
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              _formKey.currentState?.save();
              widget.onSubmit(_formData);
            }
          },
          width: MediaQuery.of(context).size.width - 50,
        ),
      ),
    );
  }
}
