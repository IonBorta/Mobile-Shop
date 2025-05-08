import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Details",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,height: 26/18),),
        const SizedBox(height: 16,),
        Text(
          "Loremp ipsum Loremp ipsum Loremp ipsum Loremp ipsum Loremp ipsum Loremp ipsum Loremp ipsum Loremp ipsum Loremp ipsum Loremp ipsum Loremp ipsum Loremp ipsum ",
          style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,height: 20/14),
        ),

      ],
    );
  }
}