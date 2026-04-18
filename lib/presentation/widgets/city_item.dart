import 'package:flutter/material.dart';

class CityItem extends StatelessWidget {
  const CityItem({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.black,
            strokeAlign: BorderSide.strokeAlignInside,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Text(name, style: TextStyle(fontSize: 20, fontWeight: .bold),),
    );
  }
}
