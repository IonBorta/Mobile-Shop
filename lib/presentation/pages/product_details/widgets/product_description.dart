import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  final String details;
  const ProductDescription({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Details",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,height: 26/18),textAlign: TextAlign.start,),
        const SizedBox(height: 16,),
        Text(
          details,
          style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,height: 20/14),
        ),

      ],
    );
  }
}