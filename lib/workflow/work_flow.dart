import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:try4/models/inferencemodel.dart';
import 'package:try4/models/parameta.dart';

class WorkflowForm extends StatefulWidget {
  final InferenceDetails details;
  final Function(Map<String, dynamic>) onSubmit;

  const WorkflowForm({
    required this.details,
    required this.onSubmit,
    super.key,
  });

  @override
  State<WorkflowForm> createState() => _WorkflowFormState();
}

class _WorkflowFormState extends State<WorkflowForm> {
  bool _showAdvanced = false;
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};
  Map<String, ParameterMetadata>? _parameters;

  @override
  void initState() {
    super.initState();
    _parameters = widget.details.parameters?.metadata;
    _initializeFormData();
  }

  void _initializeFormData() {
    if (_parameters != null) {
      _parameters!.forEach((key, metadata) {
        if (!metadata.hidden) {
          _formData[key] = metadata.displayValue ?? metadata.defaultValue;
        }
      });
    }
  }

  List<Widget> _buildFormFields() {
    if (_parameters == null) return [];

    var sortedEntries = _parameters!.entries.toList()
      ..sort((a, b) => a.value.displayOrder.compareTo(b.value.displayOrder));

    return sortedEntries.where((entry) {
      final metadata = entry.value;
      // Show all non-hidden fields if advanced mode is on
      if (!_showAdvanced) {
        return !metadata.hidden;
      }
      // Otherwise show only non-hidden and non-advanced fields
      return !(metadata.isAdvanced ?? false);
    }).map((entry) {
      final key = entry.key;
      final metadata = entry.value;

      switch (metadata.type) {
        case "str":
          {
            if (metadata.component == "dropdown") {
              return _buildDropdown(
                key: key,
                label: metadata.label,
                options: metadata.options ?? [],
                defaultValue: metadata.defaultValue,
                isRequired: metadata.isRequired,
                description: metadata.description,
                values: metadata.values ?? [],
              );
            }
            return _buildTextField(
              key: key,
              label: metadata.label,
              defaultValue: metadata.defaultValue,
              isRequired: metadata.isRequired,
              description: metadata.description,
              type: metadata.type,
            );
          }
        case "image":
          return _buildTextField(
            key: key,
            label: metadata.label,
            defaultValue: metadata.defaultValue,
            isRequired: metadata.isRequired,
            description: metadata.description,
            type: metadata.type,
          );

        case "int":
        case "slider":
          return _buildSlider(
            key: key,
            label: metadata.label,
            max: metadata.max ?? 100000000,
            min: metadata.min ?? 0,
            defaultValue: (metadata.defaultValue is String)
                ? double.tryParse(metadata.defaultValue) ?? 0.0
                : metadata.defaultValue,
            isRequired: metadata.isRequired,
            description: metadata.description,
          );

        default:
          return const SizedBox.shrink();
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text(widget.details.title ?? '',
            style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(_showAdvanced ? Icons.tune : Icons.tune_outlined),
            onPressed: () => setState(() => _showAdvanced = !_showAdvanced),
            tooltip: 'Advanced Options',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: _buildFormFields(),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                print('Form Data: $_formData'); // Debug print
                widget.onSubmit(_formData);
              }
            },
            child: const Text('Submit'),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String key,
    required String label,
    required String type,
    dynamic defaultValue,
    required bool isRequired,
    String? description,
  }) {
    if (type == "image") {
      return Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: defaultValue != null
                  ? _buildImageWidget(defaultValue.toString())
                  : Center(
                      child: Icon(
                        Icons.image_not_supported,
                        color: Colors.grey[600],
                        size: 50,
                      ),
                    ),
            ),
            if (label.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(label),
              ),
          ],
        ),
      );
    } else {
      bool isUrl = defaultValue != null &&
          (defaultValue.toString().startsWith('http') ||
              defaultValue.toString().startsWith('https'));

      // If URL, show as image
      if (isUrl) {
        return Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (label.isNotEmpty)
                Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CachedNetworkImage(
                  imageUrl: defaultValue.toString(),
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.broken_image, color: Colors.grey[600]),
                        SizedBox(height: 8),
                        Text('Failed to load image'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(color: Colors.white)),
              if (description != null)
                Text(description, style: TextStyle(color: Colors.grey)),
              TextFormField(
                initialValue:
                    _formData[key]?.toString() ?? defaultValue?.toString(),
                validator: (value) {
                  if (isRequired && (value == null || value.isEmpty)) {
                    return 'This field is required';
                  }
                  return null;
                },
                onChanged: (value) => _formData[key] = value,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[850],
                ),
              ),
            ],
          ),
        );
      }
    }
  }

  Widget _buildImageWidget(String source) {
    if (source.startsWith('http') || source.startsWith('https')) {
      return CachedNetworkImage(
        imageUrl: source,
        fit: BoxFit.cover,
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) {
          print('Image Error: $error for URL: $url'); // Debug print
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.broken_image, color: Colors.grey[600]),
                SizedBox(height: 8),
                Text(
                  'Failed to load image',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          );
        },
        httpHeaders: {
          'Accept': 'image/jpeg,image/png,image/*',
          'Access-Control-Allow-Origin': '*',
        },
        fadeInDuration: Duration(milliseconds: 300),
        memCacheWidth: 800,
        maxHeightDiskCache: 1000,
      );
    } else if (source.startsWith('assets/')) {
      return Image.asset(
        source,
        fit: BoxFit.cover,
      );
    }
    return Center(
      child: Icon(Icons.error_outline, color: Colors.grey[600]),
    );
  }

  Widget _buildSlider({
    required dynamic key,
    required String label,
    required double min,
    required double max,
    required dynamic defaultValue,
    required bool isRequired,
    String? description,
  }) {
    double currentValue = min;

    // Convert defaultValue to double
    if (!_formData.containsKey(key)) {
      if (defaultValue != null) {
        if (defaultValue is num) {
          currentValue = defaultValue.toDouble();
        } else if (defaultValue is String &&
            double.tryParse(defaultValue) != null) {
          currentValue = double.parse(defaultValue);
        }
      }
      _formData[key] = currentValue;
    }
    double getValue() {
      var value = _formData[key];
      if (value is int) return value.toDouble();
      if (value is String) return double.tryParse(value) ?? min;
      if (value is double) return value;
      return min;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          if (description != null)
            Text(
              description,
              style: TextStyle(color: Colors.grey[400], fontSize: 12),
            ),
          Row(
            children: [
              Expanded(
                child: Slider(
                  value: getValue().clamp(min, max),
                  min: min,
                  max: max,
                  divisions: ((max - min) * 10).toInt(),
                  label: getValue().toStringAsFixed(2),
                  onChanged: (value) {
                    setState(() => _formData[key] = value);
                  },
                  activeColor: Colors.blue,
                  inactiveColor: Colors.grey,
                ),
              ),
              SizedBox(
                width: 50,
                child: Text(
                  getValue().toStringAsFixed(2),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          if (isRequired)
            Text(
              'Required',
              style: TextStyle(color: Colors.red[400], fontSize: 12),
            ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String key,
    required String label,
    required List<dynamic> options,
    dynamic defaultValue,
    required bool isRequired,
    String? description,
    required List<dynamic> values,
  }) {
    print('Values: $values');
    // Create dropdown items from options
    final List<dynamic> uniqueValues = values.isNotEmpty ? values : [];

    // Ensure unique dropdown values

    // Create dropdown items

    // Create dropdown items
    List<DropdownMenuItem<String>> items = uniqueValues.map((item) {
      return DropdownMenuItem<String>(
        value: item.toString(),
        child: Text(
          item.toString(),
          style: TextStyle(color: Colors.white),
        ),
      );
    }).toList();

    // Convert default value to string
    // Set the initial value for the dropdown
    String? currentValue = _formData[key]?.toString();
    // String? currentValue = "test";

    // Ensure initial value matches an item in the dropdown
    if (currentValue == null ||
        !uniqueValues.map((e) => e.toString()).contains(currentValue)) {
      currentValue =
          uniqueValues.isNotEmpty ? uniqueValues.first.toString() : null;
    }

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          if (description != null)
            Text(description,
                style: TextStyle(color: Colors.grey[400], fontSize: 12)),
          SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: currentValue,
            items: items,
            onChanged: (value) {
              setState(() => _formData[key] = value);
            },
            dropdownColor: Colors.grey[850],
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[850],
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
        ],
      ),
    );
  }
}
