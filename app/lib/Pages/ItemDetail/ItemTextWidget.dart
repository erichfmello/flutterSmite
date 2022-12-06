import 'package:flutter/material.dart';

class ItemTextWidget extends StatelessWidget {
  late String? costText;
  late String description;
  late double width;
  late double height;

  ItemTextWidget(
      {super.key,
      required this.description,
      required this.width,
      required this.height,
      this.costText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (costText != null)
          Container(
            margin: const EdgeInsets.only(
              bottom: 5,
            ),
            child: Text(
              costText.toString(),
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        SizedBox(
          width: width,
          height: height,
          child: ListView(
            children: <Widget>[
              Text(
                description.toString(),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
