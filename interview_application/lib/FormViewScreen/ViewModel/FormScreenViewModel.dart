// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:interview_application/FormViewScreen/Model/FormScreenModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_application/Helpers/LoadJson.dart';

final formViewModelProvider = ChangeNotifierProvider((ref) => FormViewModel());


class FormViewModel extends ChangeNotifier {
  List<FormFieldModel> formFields = [];
  String selectedF1Value = '';

  void loadFormFields() async {
    formFields = await FormHelper().loadFormData();
    notifyListeners();
  }


  bool isVisible(FormFieldModel field) {
    if (field.visibleCondition == null) {
      return true; // Always visible if no condition
    }
    if (field.visibleCondition?.contains(selectedF1Value) ?? false) {
      return true;
    } else {
      return false;
    }
  }

  void updateSelectedF1Value(String value) {
    selectedF1Value = value;
    notifyListeners();
  }
}
