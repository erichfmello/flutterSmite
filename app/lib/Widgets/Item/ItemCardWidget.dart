import 'package:app/Controlller/Home/homeController.dart';
import 'package:app/Models/types.dart';
import 'package:flutter/material.dart';

class ItemCardWidget extends StatelessWidget {
  ItemCard itemCard;
  List<ItemCard> list = [];
  bool isRecomendedItem = false;

  HomeController controller = HomeController();

  ItemCardWidget({super.key, required this.list, required this.itemCard, this.isRecomendedItem = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(itemCard.url),
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
            controller.NavigationItem(context, list, itemCard, isRecomendedItem),
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                itemCard.name,
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