import 'dart:async';
import 'dart:convert';
import 'package:app/services/ApiServices.dart';

import '../Models/types.dart';

class GodsAndItemsServices {
  late ApiServices services;

  Future<GodListResponse> GodList(GodListRequest request) async {
    String body = jsonEncode(request.toJson());
    String endPonint = 'v1/GodsAndItems/GodList';
    ApiServices services = ApiServices();

    var responseStrign = await services.post(body, endPonint);
    var response = jsonDecode(responseStrign.body);

    GodListResponse godList = GodListResponse.fromJson(response);

    return godList;
  }

  Future<ItemListResponse> ItemList(ItemListRequest request) async {
    String body = jsonEncode(request.toJson());
    String endPonint = 'v1/GodsAndItems/ItemList';
    ApiServices services = ApiServices();

    var responseStrign = await services.post(body, endPonint);
    var response = jsonDecode(responseStrign.body);

    ItemListResponse itemList = ItemListResponse.fromJson(response);

    return itemList;
  }

  Future<ItemRecomendedListResponse> ItemRecomendedList(ItemRecomendedListRequest request) async {
    String body = jsonEncode(request.toJson());
    String endPonint = 'v1/GodsAndItems/ItemRecomendedList';
    ApiServices services = ApiServices();

    var responseStrign = await services.post(body, endPonint);
    var response = jsonDecode(responseStrign.body);

    ItemRecomendedListResponse itemList = ItemRecomendedListResponse.fromJson(response);

    return itemList;
  }
}
