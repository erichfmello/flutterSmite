import 'package:flutter/material.dart';

class GodLoreWidget extends StatelessWidget {
  late String lore;

  GodLoreWidget({super.key, required this.lore});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 50,
      ),
      height: MediaQuery.of(context).size.height - 350,
      child: ListView(
        children: <Widget>[
          Text(
            lore,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
