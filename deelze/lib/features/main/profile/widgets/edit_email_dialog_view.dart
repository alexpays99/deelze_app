import 'package:deelze/features/main/profile/email_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditEmailDialogView extends StatelessWidget {
  const EditEmailDialogView({
    super.key,
    required this.text,
    required this.onCancel,
    required this.onConfirm,
    this.hintText,
  });
  final String text;
  final void Function() onCancel;
  final void Function() onConfirm;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(text,
          style: const TextStyle(
            color: Color.fromRGBO(131, 131, 131, 1),
            fontWeight: FontWeight.w500,
            fontFamily: 'Nutrio',
            fontSize: 25,
          )),
      content: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: EmailPasswordTextFieldS(
          hintText: hintText ?? '',
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          onChanged: (inputData) {},
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => onCancel(),
          child: Text(
            "Cancel",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.blue, fontWeight: FontWeight.w500),
          ),
        ),
        TextButton(
          onPressed: () => onConfirm(),
          child: Text(
            "Save",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.blue, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
