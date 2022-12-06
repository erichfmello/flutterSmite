import 'package:flutter/material.dart';

class ItemPiplineWidget extends StatelessWidget {
  late List<String> url;
  late String pricipalUrl;

  ItemPiplineWidget({super.key, required this.url, required this.pricipalUrl});

  @override
  Widget build(BuildContext context) {
    return url.isNotEmpty
        ? SizedBox(
            width: double.infinity - 20,
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                for (int i = url.length - 1; i >= 0; i--)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(url[i]),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(pricipalUrl),
                    ),
                  ),
                ),
              ],
            ))
        : Container();
  }
}
