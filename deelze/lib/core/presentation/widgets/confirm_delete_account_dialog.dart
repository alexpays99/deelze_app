import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmAccountDialog extends StatelessWidget {
  const ConfirmAccountDialog({
    super.key,
    required this.text,
    required this.onCancel,
    required this.onConfirm,
  });
  final String text;
  final void Function() onCancel;
  final void Function() onConfirm;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => onCancel(),
          child: Text(
            "Cancel",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.red,
                ),
          ),
        ),
        TextButton(
          onPressed: () => onConfirm(),
          child: Text(
            'Yes',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.blueAccent,
                ),
          ),
        ),
      ],
    );
  }
}
