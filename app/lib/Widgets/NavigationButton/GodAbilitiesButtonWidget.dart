import 'package:flutter/material.dart';

class GodAbilitiesWidget extends StatelessWidget {
  late String url;
  late int page;
  late double size;

  final changeAbility;

  GodAbilitiesWidget({super.key, required this.url, required this.changeAbility, required this.page, required this.size});

  void pressButton() {
    changeAbility(page);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            url,
          ),
          fit: BoxFit.fill,
        ),
        border: Border.all(
          color: const Color(0xFF85784A),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: TextButton(
        onPressed: () => pressButton(),
        child: const Text(''),
      ),
    );
  }
}
