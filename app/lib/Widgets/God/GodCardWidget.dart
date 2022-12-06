import 'package:app/Models/types.dart';
import 'package:app/controlller/home/homeController.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GodCardWidget extends StatelessWidget {
  GodCard godCard;
  HomeController controller = HomeController();

  GodCardWidget({super.key, required this.godCard});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(godCard.imageUrl),
            fit: BoxFit.cover,
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
          onPressed: () => {
            controller.Navigation(context, godCard),
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                godCard.name,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
