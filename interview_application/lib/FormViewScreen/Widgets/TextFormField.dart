import 'package:flutter/material.dart';
import 'package:interview_application/FormViewScreen/Model/FormScreenModel.dart';
import 'package:interview_application/FormViewScreen/ViewModel/FormScreenViewModel.dart';

class TextfieldFormField extends StatelessWidget {
  final FormFieldModel field;
  final FormViewModel viewModel;

  TextfieldFormField({required this.field, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: viewModel.isVisible(field),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: field.fieldName,
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}