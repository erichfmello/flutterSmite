import 'package:app/Pages/GodDetail/GodDetailPage.dart';
import 'package:app/Pages/ItemDetail/ItemDetailPage.dart';
import 'package:app/Services/godsAndItemsServices.dart';
import 'package:flutter/material.dart';

import '../../Models/types.dart';
import '../../Widgets/Modal/LoadingModalWidget.dart';

class HomeController {
  late List<GodCard> godCard = [];
  late List<GodCard> godCardFiltered = [];
  late List<ItemCard> itemCard = [];

  late GodsAndItemsServices godsAndItemsServices;

  HomeController() {
    start();
  }

  void start() {
    godsAndItemsServices = GodsAndItemsServices();
  }

  Future<void> godList(BuildContext context) async {
    GodListRequest request = GodListRequest();
    try {
      GodListResponse response = await godsAndItemsServices.GodList(request);
      godCard = response.items;
    } catch (error) {
      print(error);
    }
  }

  Future<void> itemList() async {
    ItemListRequest request = ItemListRequest();
    try {
      ItemListResponse response = await godsAndItemsServices.ItemList(request);
      itemCard = response.items;
    } catch (error) {
      print(error);
    }
  }

  Future<void> ItemRecomendedList(int godID, BuildContext context) async {
    ShowLoadind(context);
    ItemRecomendedListRequest request = ItemRecomendedListRequest();
    request.godID = godID;
    try {
      ItemRecomendedListResponse response =
          await godsAndItemsServices.ItemRecomendedList(request);
      itemCard = response.items;
    } catch (error) {
      print(error);
    }
    HideLoadind(context);
  }

  List<GodCard> godListFilterSet(List<GodCard> list, String text) {
    list = list
        .where((element) =>
            element.name.toUpperCase().contains(text.toUpperCase()))
        .toList();

    return list;
  }

  List<ItemCard> itemListFilterSet(List<ItemCard> list, String text) {
    list = list
        .where((element) =>
            element.name.toUpperCase().contains(text.toUpperCase()))
        .toList();

    return list;
  }

  void Navigation(BuildContext context, GodCard god) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => GodDetailPage(god: god)));
  }

  void NavigationItem(
    BuildContext context,
    List<ItemCard> list,
    ItemCard item,
    bool isRecomendedItem,
  ) {
    int value = item.cost;
    int difference = item.cost;

    int childItemID = item.childItemID;

    item.childUrls = [];
    item.costText = difference.toString();

    if (!isRecomendedItem) {
      for (int i = item.tier; i > 0; i--) {
        if (i == item.tier) continue;

        ItemCard card =
            list.where((element) => element.itemID == childItemID).toList()[0];
        value += card.cost;
        childItemID = card.childItemID;

        item.childUrls.add(card.url);
      }
    }

    if (item.tier != 1) item.costText = '${difference} (${value})';

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ItemDetailPage(
                  item: item,
                )));
  }

  void ShowLoadind(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) => LoadingModalWidget()));
  }

  void HideLoadind(BuildContext context) {
    Navigator.of(context).pop(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) => LoadingModalWidget()));
  }
}
