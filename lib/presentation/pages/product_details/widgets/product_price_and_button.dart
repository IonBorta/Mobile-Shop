import 'package:flutter/material.dart';

class ProductPriceAndButton extends StatelessWidget {
  final double price;
  const ProductPriceAndButton({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      padding: EdgeInsets.symmetric(horizontal: 30,),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _Price(price: price),
          _AddButton(),
        ],
      ),
    );
  }
}

class _Price extends StatelessWidget {
  final double price;
  const _Price({required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "PRICE",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 12 / 16,
            color: Color(0xff929292),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          " \$$price",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            height: 24 / 18,
            color: Color(0xff00C569),
          ),
        ),
      ],
    );
  }
}
class _AddButton extends StatelessWidget {
  const _AddButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Color(0XFF00C569)),
        padding: WidgetStatePropertyAll(
          const EdgeInsets.symmetric(horizontal: 58, vertical: 26),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
      ),
      onPressed: () {},
      child: Text(
        "ADD",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 20 / 14,
          color: Colors.white,
        ),
      ),
    );
  }
}
