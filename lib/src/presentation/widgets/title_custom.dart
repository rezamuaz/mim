import 'package:flutter/material.dart';

class TitleCustom extends StatelessWidget {
  const TitleCustom(
      {Key? key,
      this.title = '',
      this.fontSize = 12,
      this.fontWeight = FontWeight.bold})
      : super(key: key);
  final String? title;
  final double? fontSize;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
