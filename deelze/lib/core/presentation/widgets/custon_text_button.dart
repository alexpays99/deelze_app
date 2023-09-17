import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.color,
    this.textColor,
    this.textSize,
    this.onTap,
  });

  final String text;
  final double width;
  final double height;
  final Color color;
  final Color? textColor;
  final double? textSize;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          color: color,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: textColor ?? Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: textSize ?? 18),
        ),
      ),
    );
  }
}
