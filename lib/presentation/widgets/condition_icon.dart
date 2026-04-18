import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ConditionIcon extends StatelessWidget {
  const ConditionIcon({super.key, required this.icon, required this.text});
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 150,
          height: 100,
          child: CachedNetworkImage(imageUrl: 'http:$icon', fit: .cover),
        ),
        Text(text, style: TextStyle(fontSize: 14, fontWeight: .bold)),
      ],
    );
  }
}
