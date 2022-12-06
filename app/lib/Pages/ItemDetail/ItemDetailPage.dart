import 'package:app/Models/types.dart';
import 'package:app/Pages/ItemDetail/ItemPiplineWidget.dart';
import 'package:app/Pages/ItemDetail/ItemTextWidget.dart';
import 'package:app/Widgets/Item/ItemCardImageWidget.dart';
import 'package:flutter/material.dart';

class ItemDetailPage extends StatelessWidget {
  late ItemCard item;

  ItemDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF05111E),
        centerTitle: true,
        title: Text(
          item.name,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          left: 20,
          top: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ItemCardImageWidget(imageUrl: item.url, size: 150),
                ItemTextWidget(
                  description: item.description.toString(),
                  width: MediaQuery.of(context).size.width - 210,
                  height: 150,
                  costText: item.costText,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  for (var item in item.itemCardDescriptions)
                    ItemTextWidget(
                      description: '${item.value} ${item.description}',
                      width: double.infinity,
                      height: 25,
                    ),
                ],
              ),
            ),
            item.descriptionSecundary != null
                ? ItemTextWidget(
                    description: item.descriptionSecundary.toString(),
                    width: double.infinity,
                    height: 100,
                  )
                : Container(),
            const SizedBox(
              height: 20,
            ),
            ItemPiplineWidget(url: item.childUrls, pricipalUrl: item.url),
          ],
        ),
      ),
    );
  }
}
