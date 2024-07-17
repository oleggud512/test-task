import 'package:flutter/material.dart';
import 'package:test_task/src/core/common/constants/sizes.dart';
import 'package:test_task/src/core/common/extensions/string.dart';
import 'package:test_task/src/core/presentation/dialog_widget.dart';

class ErrorMessageDialog extends StatelessWidget with DialogWidget<void> {
  const ErrorMessageDialog({
    super.key,
    required this.message
  });

  final String message;

  void onClose(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(p16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              leading: Icon(Icons.error_outline, 
                color: Theme.of(context).colorScheme.error
              ),
              title: Text(message)
            ),
            h16gap,
            FilledButton(
              onPressed: () => onClose(context),
              child: Text("Close".hardcoded),
            )
          ]
        ),
      )
    );
  }
}