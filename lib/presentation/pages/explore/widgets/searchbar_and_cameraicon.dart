import 'package:flutter/material.dart';

class SearchBarAndCameraIcon extends StatelessWidget {
  const SearchBarAndCameraIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30,bottom: 16),
      height: 40,
      child: Row(
        children: [
          Expanded(
            child: SearchBar(
              backgroundColor: WidgetStateProperty.all(Color(0xFFF7F7F7)),
              leading: Icon(Icons.search,size: 24,),
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
                  ),
                ),
                elevation: const WidgetStatePropertyAll(0),
                onTap: () {}, 
                onChanged: (text) {}, 
            )
          ), 
          SizedBox(width: 13,),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xff00C569),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.camera_alt_outlined,
              size: 24,
              color: Colors.white,
              weight: 1.5,
            ),
          )
        ]
      ),
    );
  }
}