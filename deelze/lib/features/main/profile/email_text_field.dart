import 'package:flutter/material.dart';

enum EmailPasswordTextFieldState {
  initial,
  valid,
  error,
}

class EmailPasswordTextFieldS extends StatefulWidget {
  final EmailPasswordTextFieldState passwordTextFieldState;
  final String? helperText;
  final BorderSide? borderSide;
  final Color? suffixColor;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final bool isPassword;
  final void Function(String input) onChanged;

  const EmailPasswordTextFieldS({
    super.key,
    this.passwordTextFieldState = EmailPasswordTextFieldState.initial,
    this.helperText,
    this.borderSide,
    this.prefixIcon,
    this.suffixColor,
    this.suffixIcon,
    required this.hintText,
    this.isPassword = false,
    required this.onChanged,
  });

  @override
  State<EmailPasswordTextFieldS> createState() =>
      _EmailPasswordTextFieldSState();
}

class _EmailPasswordTextFieldSState extends State<EmailPasswordTextFieldS> {
  final controller = TextEditingController();
  late bool hidePassword = widget.isPassword ? true : false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);

    return TextFormField(
      controller: controller,
      obscureText: hidePassword,
      onChanged: widget.onChanged,
      style: style.textTheme.titleSmall,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        suffixIconColor: const Color.fromRGBO(7, 106, 127, 1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(21),
          borderSide: widget.borderSide ??
              const BorderSide(
                color: Colors.white,
              ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(21),
          borderSide: widget.borderSide ??
              const BorderSide(
                color: Colors.white,
              ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(21),
          borderSide: widget.borderSide ??
              const BorderSide(
                color: Colors.white,
              ),
        ),
        helperText: widget.helperText,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontFamily: 'Nutrio',
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
    );
  }
}
