import 'package:flutter/material.dart';

class ItemCardImageWidget extends StatelessWidget {
  late String imageUrl;
  late double size;
  late double borderSize;

  ItemCardImageWidget({super.key, required this.imageUrl, required this.size, this.borderSize = 2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.only(
        right: 20,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            imageUrl,
          ),
          fit: BoxFit.fill,
        ),
        border: Border.all(
          color: const Color(0xFF85784A),
          width: borderSize,
        ),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
    );
  }
}
