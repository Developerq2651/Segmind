import 'package:try4/models/inferencemodel.dart';

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
