import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  final String title;
  const ProductTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          height: 36/26
        ),
      ),
    );
  }
}