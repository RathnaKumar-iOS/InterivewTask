// ignore: file_names
class FormFieldModel {
  final String fieldName;
  final String widgetType;
  final List<String>? validValues;
  final String? visibleCondition;
  bool? showFields;

  FormFieldModel({
    required this.fieldName,
    required this.widgetType,
    this.validValues,
    this.visibleCondition,
  });
}
