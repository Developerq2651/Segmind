class ParameterMetadata {
  final bool isRequired;
  final bool affectsPricing;
  final String? displayValue;
  final String label;
  final dynamic defaultValue;
  final double? min;
  final double? max;
  final int displayOrder;
  final String? description;
  final dynamic component;
  final bool hidden;
  final bool? isAdvanced; // New field

  final String type;
  final List<String>? options;
  final List<dynamic>? values; // Changed to List<double>

  ParameterMetadata({
    required this.type,
    required this.isRequired,
    required this.affectsPricing,
    this.displayValue,
    required this.label,
    this.defaultValue,
    this.min,
    this.max,
    required this.displayOrder,
    this.description,
    required this.component,
    this.hidden = false,
    this.isAdvanced = false, // Default to false
    this.options,
    this.values,
  });

  factory ParameterMetadata.fromJson(Map<String, dynamic> json) {
    // Convert values to double safely

    final defaultValue = json['default'];
    final normalizedDefaultValue = defaultValue is String
        ? double.tryParse(defaultValue) ?? defaultValue
        : defaultValue;
    return ParameterMetadata(
      isRequired: json['isRequired'] ?? false,
      affectsPricing: json['affectsPricing'] ?? false,
      displayValue: json['displayValue']?.toString(),
      label: json['label'] ?? '',
      defaultValue: normalizedDefaultValue,
      min: json['min']?.toDouble(),
      max: json['max']?.toDouble(),
      displayOrder: json['displayOrder'] ?? 0,
      description: json['description']?.toString(),
      component: json['component'] ?? 'text',
      hidden: json['hidden'] ?? false,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      values:
          (json['values'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
      type: json['type'] ?? 'text',
      isAdvanced: json['isAdvanced'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isRequired': isRequired,
      'affectsPricing': affectsPricing,
      'displayValue': displayValue,
      'label': label,
      'default': defaultValue,
      'min': min,
      'max': max,
      'displayOrder': displayOrder,
      'description': description,
      'component': component,
      'hidden': hidden,
      'options': options,
      'type': type,
      'values': values, // Added to toJson
      'isAdvanced': isAdvanced,
    };
  }
}
