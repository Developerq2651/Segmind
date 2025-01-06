import 'package:try4/models/parameta.dart';

class InferenceDetails {
  String? title;
  String? type;
  Parameters? parameters;
  String? slug;
  String? description;
  bool? isVisible;
  String? defaultImageOutput;
  dynamic thumbnailImage;
  bool? isDepreciated;
  bool? isNew;

  InferenceDetails(
      {this.title,
      this.type,
      this.parameters,
      this.slug,
      this.description,
      this.isVisible,
      this.defaultImageOutput,
      this.thumbnailImage,
      this.isDepreciated,
      this.isNew});

  InferenceDetails copyWith(
          {String? title,
          String? type,
          Parameters? parameters,
          String? slug,
          String? description,
          bool? isVisible,
          String? defaultImageOutput,
          dynamic thumbnailImage,
          bool? isDepreciated,
          bool? isNew}) =>
      InferenceDetails(
          title: title ?? this.title,
          type: type ?? this.type,
          parameters: parameters ?? this.parameters,
          slug: slug ?? this.slug,
          description: description ?? this.description,
          isVisible: isVisible ?? this.isVisible,
          defaultImageOutput: defaultImageOutput ?? this.defaultImageOutput,
          thumbnailImage: thumbnailImage ?? this.thumbnailImage,
          isDepreciated: isDepreciated ?? this.isDepreciated,
          isNew: isNew ?? this.isNew);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["title"] = title;
    map["type"] = type;
    if (parameters != null) {
      map["parameters"] = parameters?.toJson();
    }
    map["slug"] = slug;
    map["description"] = description;
    map["is_visible"] = isVisible;
    map["default_image_output"] = defaultImageOutput;
    map["thumbnail_image"] = thumbnailImage;
    map["is_depreciated"] = isDepreciated;
    map["is_new"] = isNew;
    return map;
  }

  InferenceDetails.fromJson(dynamic json) {
    title = json["title"];
    type = json["type"];
    parameters = json["parameters"] != null
        ? Parameters.fromJson(json["parameters"])
        : null;
    slug = json["slug"];
    description = json["description"];
    isVisible = json["is_visible"];
    defaultImageOutput = json["default_image_output"];
    thumbnailImage = json["thumbnail_image"];
    isDepreciated = json["is_depreciated"];
    isNew = json["is_new"];
  }
}

class Workflowmodel {
  List<InferenceDetails>? inferencedetailsList;

  Workflowmodel({this.inferencedetailsList});

  Workflowmodel copyWith({List<InferenceDetails>? inferencedetailsList}) =>
      Workflowmodel(
          inferencedetailsList:
              inferencedetailsList ?? this.inferencedetailsList);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (inferencedetailsList != null) {
      map["InferenceDetails"] =
          inferencedetailsList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  Workflowmodel.fromJson(dynamic json) {
    if (json["InferenceDetails"] != null) {
      inferencedetailsList = [];
      json["InferenceDetails"].forEach((v) {
        inferencedetailsList?.add(InferenceDetails.fromJson(v));
      });
    }
  }
}

class Parameters {
  final bool isRequired;
  final bool affectsPricing;
  final String? displayValue;
  final String label;
  final dynamic defaultValue;
  final double? min;
  final double? max;
  final int displayOrder;
  final String? description;
  final String component;
  final bool hidden;
  final List<String>? options;
  final Map<String, ParameterMetadata>? metadata;

  Parameters({
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
    this.options,
    this.metadata,
  });

  factory Parameters.fromJson(Map<String, dynamic> json) {
    Map<String, ParameterMetadata> metadata = {};
    json.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        metadata[key] = ParameterMetadata.fromJson(value);
      }
    });

    return Parameters(
      isRequired: json['isRequired'] ?? false,
      affectsPricing: json['affectsPricing'] ?? false,
      displayValue: json['displayValue']?.toString(),
      label: json['label'] ?? '',
      defaultValue: json['default'],
      min: json['min']?.toDouble(),
      max: json['max']?.toDouble(),
      displayOrder: json['displayOrder'] ?? 0,
      description: json['description']?.toString(),
      component: json['component'] ?? 'text',
      hidden: json['hidden'] ?? false,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      metadata: metadata,
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
    };
  }
}
