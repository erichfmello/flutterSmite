import 'package:flutter/material.dart';

import '../../Models/types.dart';

class GodAbilityWidget extends StatelessWidget {
  late Ability godAbilities;

  GodAbilityWidget({super.key, required this.godAbilities});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 300,
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            godAbilities.summary,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            godAbilities.description,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          for (var item in godAbilities.abilityDescriptions)
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  item.description,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  item.value,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              if (godAbilities.cost != '')
                Column(
                  children: <Widget>[
                    const Text('Custo de mana:'),
                    Text(godAbilities.cost),
                  ],
                ),
              if (godAbilities.cooldown != '')
                Column(
                  children: <Widget>[
                    const Text('Cooldown'),
                    Text(godAbilities.cooldown),
                  ],
                ),
            ],
          )
        ],
      ),
    );
  }
}
