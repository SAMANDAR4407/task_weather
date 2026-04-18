import 'package:flutter/material.dart';

class ConditionInfo extends StatelessWidget {
  const ConditionInfo({super.key, required this.text, required this.size});
  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: size, fontWeight: .bold), textAlign: .center);
  }
}
