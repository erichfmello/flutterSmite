import 'package:app/Models/types.dart';
import 'package:app/Widgets/Item/ItemCardWidget.dart';
import 'package:app/Widgets/Modal/LoadingModalWidget.dart';
import 'package:flutter/material.dart';
import '../../Controlller/Home/homeController.dart';
import '../../Widgets/God/GodCardWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GodCard> godCards = [];
  List<GodCard> godCardsShow = [];
  List<ItemCard> itemCards = [];
  List<ItemCard> itemCardsShow = [];
  late String findText = 'Pesquise um deus';
  late bool isGodSelected = true;

  HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();
    godCardsSet();
    itemCardsSet();
  }

  Future<void> godCardsSet() async {
    await controller.godList(context);
    godCards = controller.godCard;
    setState(() {
      godCardsShow = controller.godCard;
    });
  }

  Future<void> itemCardsSet() async {
    await controller.itemList();
    itemCards = controller.itemCard;
  }

  void changeGodCards(String text) {
    setState(() {
      godCardsShow = controller.godListFilterSet(godCards, text);
    });
  }

  void changeItemCards(String text) {
    setState(() {
      itemCardsShow = controller.itemListFilterSet(itemCards, text);
    });
  }

  void changeVisibility(bool change) {
    setState(() {
      isGodSelected = change;

      if (isGodSelected) {
        findText = 'Pesquise um deus';
        godCardsShow = controller.godCard;
        itemCardsShow = [];
      } else {
        findText = 'Pesquise um item';
        godCardsShow = [];
        itemCardsShow = controller.itemCard;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              left: 20,
              right: 20,
            ),
            child: TextField(
              style: const TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 18,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFF85784A),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                hintText: findText,
                hintStyle: const TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 14,
                ),
              ),
              onChanged: (value) => {
                if (isGodSelected)
                  {
                    changeGodCards(value),
                  }
                else
                  {
                    changeItemCards(value),
                  }
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                isGodSelected
                    ? Container(
                        width: 100,
                        height: 52,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF85784A),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              onPressed: () => {changeVisibility(true)},
                              child: const Text(
                                'Deuses',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                            onPressed: () => {changeVisibility(true)},
                            child: const Text(
                              'Deuses',
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ],
                      ),
                isGodSelected
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                            onPressed: () => {changeVisibility(false)},
                            child: const Text(
                              'Items',
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(
                        width: 100,
                        height: 52,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF85784A),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              onPressed: () => {
                                changeVisibility(false),
                              },
                              child: const Text(
                                'Items',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: <Widget>[
                    for (var item in godCardsShow) GodCardWidget(godCard: item),
                    for (var item in itemCardsShow)
                      ItemCardWidget(list: itemCards, itemCard: item),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
