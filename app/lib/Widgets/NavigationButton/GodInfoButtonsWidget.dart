import 'package:app/Controlller/Home/homeController.dart';
import 'package:flutter/material.dart';

class GodInfoButtons extends StatelessWidget {
  final changeLore;
  late int buttonSelected;

  GodInfoButtons(
      {super.key, required this.changeLore, required this.buttonSelected});

  void changeLoreVisibility(int page) {
    changeLore(page);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 50,
        bottom: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextButton(
            onPressed: () => {
              changeLoreVisibility(0),
            },
            child: buttonSelected == 0
                ? Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFF85784A),
                          width: 2,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Folclore',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16,
                      ),
                    ),
                  )
                : const Text(
                    'Folclore',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 16,
                    ),
                  ),
          ),
          TextButton(
            onPressed: () => {
              changeLoreVisibility(1),
            },
            child: buttonSelected == 1
                ? Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFF85784A),
                          width: 2,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Habilidades',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16,
                      ),
                    ),
                  )
                : const Text(
                    'Habilidades',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 16,
                    ),
                  ),
          ),

          TextButton(
            onPressed: () => {
              changeLoreVisibility(2),
            },
            child: buttonSelected == 2
                ? Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFF85784A),
                          width: 2,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Items recomendados',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16,
                      ),
                    ),
                  )
                : const Text(
                    'Items recomendados',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 16,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
