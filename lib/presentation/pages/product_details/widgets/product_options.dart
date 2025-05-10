import 'package:flutter/material.dart';

class ProductOptionsRow extends StatelessWidget {
  final String size;
  final String color;

  final _decoration = BoxDecoration(
    border: Border.all(color: Colors.grey.shade200),
    borderRadius: BorderRadius.circular(25),
  );

  ProductOptionsRow({super.key, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Size(size, _decoration),
        const SizedBox(width: 16),
        _Color(_decoration),
      ],
    );
  }
}
class _Size extends StatelessWidget {
  final String size;
  final BoxDecoration _decoration;
  const _Size(this.size, this._decoration);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: _decoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Size",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 20 / 14,
                ),
              ),
              Text(
                size[0],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  height: 20 / 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class _Color extends StatelessWidget {
  final BoxDecoration _decoration;
  const _Color(this._decoration);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: _decoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Color",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 20 / 14,
                ),
              ),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
