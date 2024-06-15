import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:interview_application/FormViewScreen/Model/FormScreenModel.dart';

class FormHelper {
  // Future<List<Map<String, dynamic>>> loadFormData() async {
  //   // final jsonString = await rootBundle.loadString('assets/datas.json');
  //   // final jsonData = jsonDecode(jsonString) as List<dynamic>;
  //   // return jsonData.cast<Map<String, dynamic>>();

  // }

  Future<List<FormFieldModel>> loadFormData() async {
    final jsonString = await rootBundle.loadString('assets/datas.json');
    final jsonData = jsonDecode(jsonString) as List<dynamic>;

    // Convert JSON data to List<FormFieldModel>
    List<FormFieldModel> formFields = jsonData.map((json) {
      return FormFieldModel(
        fieldName: json['field_name'],
        widgetType: json['widget'],
        validValues: json['valid_values'] != null
            ? List<String>.from(json['valid_values'])
            : null,
        visibleCondition: json['visible'],
      );
    }).toList();

    return formFields;
  }
}
