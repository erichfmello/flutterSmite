import 'dart:async';

import 'package:flutter/material.dart';

class LoadingModalWidget extends StatefulWidget {
  LoadingModalWidget({super.key});

  @override
  State<LoadingModalWidget> createState() => _LoadingModalWidgetState();
}

class _LoadingModalWidgetState extends State<LoadingModalWidget> {
  late double angle = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 25), (obj) {
      setState(() {
        angle += 0.1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xAA000000),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform.rotate(
              angle: angle,
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://icones.pro/wp-content/uploads/2021/06/icone-chargement-rouge.png',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
