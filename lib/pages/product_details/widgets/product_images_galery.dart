import 'package:flutter/material.dart';

class ProductImagesGalery extends StatelessWidget {
  ProductImagesGalery({super.key});

  final List<String> imageUrls = [
    "https://img.joomcdn.net/9f71d172ad987354ad6ccb48e371c79cf94a116e_original.jpeg",
    "https://img.joomcdn.net/5c7057bf8d61aae173cb3dabd8a6be94249e3595_original.jpeg",
    "https://img.joomcdn.net/7f28ca352adbc2e90d551b8c6efea9468020597c_original.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 480, //MediaQuery.of(context).size.height * 0.5, // Half screen height
      child: Stack(
        children: [
          Positioned.fill(
            child: PageView.builder(
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return Image.network(
                  imageUrls[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          _GoBackIcon(),
          _FavoriteIcon(),
        ],
      ),
    );
  }
}

class _GoBackIcon extends StatelessWidget {
  const _GoBackIcon();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 88,
      left: 16,
      child: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back_ios, size: 12),
      ),
    );
  }
}

class _FavoriteIcon extends StatelessWidget {
  const _FavoriteIcon();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 88,
      right: 16,
      child: IconButton.filledTonal(
        onPressed: () {},
        icon: Icon(Icons.star_border, size: 22),
        color: Colors.black,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.white),
        ),
      ),
    );
  }
}
