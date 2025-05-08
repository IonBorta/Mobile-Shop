import 'package:flutter/material.dart';

class ProductOptionsRow extends StatelessWidget {

  final _decoration = BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade200,
              ),
              borderRadius: BorderRadius.circular(25)
            );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: _decoration,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Size",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,height: 20/14),),
                  Text("XL",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,height: 20/14),)
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            decoration: _decoration,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Color",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,height: 20/14),),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.purple
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
