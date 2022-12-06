import 'package:app/Controlller/Home/homeController.dart';
import 'package:app/Widgets/God/GodAbilityWidget.dart';
import 'package:app/Widgets/God/GodLoreWidget.dart';
import 'package:app/Widgets/God/GodTypeWidget.dart';
import 'package:app/Widgets/NavigationButton/GodAbilitiesButtonWidget.dart';
import 'package:app/Widgets/NavigationButton/GodInfoButtonsWidget.dart';
import 'package:app/Widgets/Item/ItemCardWidget.dart';
import 'package:flutter/material.dart';

import '../../Models/types.dart';

class GodDetailPage extends StatefulWidget {
  GodCard god;

  GodDetailPage({super.key, required this.god});

  @override
  State<GodDetailPage> createState() => _GodDetailPageState(goda: god);
}

class _GodDetailPageState extends State<GodDetailPage> {
  final String image = '';
  late int lorePage = 0;
  late int abilityPage = 1;

  HomeController controller = HomeController();
  List<ItemCard> itemCards = [];

  GodCard goda;

  _GodDetailPageState({required this.goda});

  Future<void> changeLore(int page) async {
    setState(() {
      lorePage = page;
    });

    if (page == 2) {
      await controller.ItemRecomendedList(goda.id, context);
      setState(() {
        itemCards = controller.itemCard;
      });
    }
  }

  void changeAbility(int page) {
    setState(() {
      abilityPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: const Color(0xFF05111E),
              elevation: 0,
              expandedHeight: MediaQuery.of(context).size.height,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.god.imageUrl),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const Icon(
                        Icons.keyboard_arrow_up_outlined,
                        color: Color(0xFFFFFFFF),
                        size: 50,
                      ),
                      Text(
                        widget.god.name,
                        style: const TextStyle(
                          fontSize: 56,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      Text(
                        widget.god.title,
                        style: const TextStyle(
                          fontSize: 28,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: ListView(
          children: <Widget>[
            GodInfoButtons(
              changeLore: changeLore,
              buttonSelected: lorePage,
            ),
            GodTypeWidget(
              god: widget.god,
            ),
            lorePage == 0
                ? GodLoreWidget(lore: widget.god.lore)
                : lorePage == 1
                    ? Container(
                        margin: const EdgeInsets.only(
                          top: 20,
                          left: 20,
                          right: 20,
                          bottom: 50,
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                for (int i = 0;
                                    i < widget.god.abilities.length;
                                    i++)
                                  abilityPage == i
                                      ? GodAbilitiesWidget(
                                          url: widget.god.abilities[i].uRL,
                                          changeAbility: changeAbility,
                                          page: i,
                                          size: 70,
                                        )
                                      : GodAbilitiesWidget(
                                          url: widget.god.abilities[i].uRL,
                                          changeAbility: changeAbility,
                                          page: i,
                                          size: 50,
                                        ),
                              ],
                            ),
                            GodAbilityWidget(
                              godAbilities: widget.god.abilities[abilityPage],
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        height: 400,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 20,
                            right: 20,
                          ),
                          child: GridView.count(
                            crossAxisCount: 3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            children: <Widget>[
                              for (var item in itemCards)
                                ItemCardWidget(list: itemCards, itemCard: item, isRecomendedItem: true),
                            ],
                          ),
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
