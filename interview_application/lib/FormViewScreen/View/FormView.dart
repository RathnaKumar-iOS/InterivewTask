import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_application/FormViewScreen/ViewModel/FormScreenViewModel.dart';
import 'package:interview_application/FormViewScreen/Widgets/DropDownField.dart';
import 'package:interview_application/FormViewScreen/Widgets/TextFormField.dart';

class FormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late FormViewModel formViewModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Form'),
      ),
      body: Consumer(
        builder: (context, watch, child) {
          final viewModel = watch.watch(formViewModelProvider);
          formViewModel = watch.watch(formViewModelProvider);

          return ListView.builder(
            itemCount: viewModel.formFields.length,
            itemBuilder: (context, index) {
              final field = viewModel.formFields[index];
              Widget widget;

              switch (field.widgetType) {
                case 'dropdown':
                  widget =
                      DropdownFormField(field: field, viewModel: viewModel);
                  break;
                case 'textfield':
                  widget =
                      TextfieldFormField(field: field, viewModel: viewModel);
                  break;
                default:
                  widget = const SizedBox.shrink();
              }

              return Visibility(
                visible: viewModel.isVisible(field),
                child: widget,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          formViewModel.loadFormFields();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
