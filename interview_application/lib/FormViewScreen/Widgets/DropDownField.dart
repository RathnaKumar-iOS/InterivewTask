import 'package:flutter/material.dart';
import 'package:interview_application/FormViewScreen/Model/FormScreenModel.dart';
import 'package:interview_application/FormViewScreen/ViewModel/FormScreenViewModel.dart';

class DropdownFormField extends StatelessWidget {
  final FormFieldModel field;
  final FormViewModel viewModel;

  DropdownFormField({required this.field, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(
        value: null, // Implement value and onChanged as needed
        items: field.validValues?.map((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          viewModel.updateSelectedF1Value(value ?? '');
        },
        decoration: InputDecoration(
          labelText: field.fieldName,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}