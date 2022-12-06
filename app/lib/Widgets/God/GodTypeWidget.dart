import 'package:flutter/material.dart';

import '../../Models/types.dart';

class GodTypeWidget extends StatelessWidget {
  late GodCard god;

  GodTypeWidget({super.key, required this.god});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(god.pantheonUrl),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              god.pantheon,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(god.rolesUrl),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              god.roles,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
