//#region Base
class BaseRequest {}

class BaseResponse {
  late String message;
  late bool success;
}

class BaseItemResponse<T> extends BaseResponse {
  late T item;
}

class BaseListResponse<T> extends BaseResponse {
  late List<T> items = [];
}
//#endregion Base

//#region God
class GodListRequest extends BaseRequest {
  Map<String, dynamic> toJson() => {};
}

class GodListResponse extends BaseListResponse<GodCard> {
  GodListResponse.fromJson(Map<String, dynamic> json) {
    var list = json['items'];
    for (var element in list) {
      items.add(GodCard.fromJson(element));
    }

    message = json['message'];
    success = json['success'];
  }
}

class GodCard {
  late int id;
  late String name;
  late String imageUrl;
  late String title;
  late String pantheon;
  late String pantheonUrl;
  late String roles;
  late String rolesUrl;
  late String lore;
  late List<Ability> abilities = [];

  GodCard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    title = json['title'];
    pantheon = json['pantheon'];
    pantheonUrl = json['pantheonUrl'];
    roles = json['roles'];
    rolesUrl = json['rolesUrl'];
    lore = json['lore'];

    var list = json['abilities'];
    for (var element in list) {
      abilities.add(Ability.fromJson(element));
    }
  }
}

class Ability {
  late String summary;
  late String uRL;

  late String description;
  late String cooldown;
  late String cost;

  late List<AbilityDescription> abilityDescriptions = [];

  Ability.fromJson(Map<String, dynamic> json) {
    summary = json['summary'];
    uRL = json['url'];
    description = json['description'];
    cooldown = json['cooldown'];
    cost = json['cost'];

    var list = json['abilityDescriptions'];
    for (var element in list) {
      abilityDescriptions.add(AbilityDescription.fromJson(element));
    }
  }
}

class AbilityDescription {
  late String description;
  late String value;

  AbilityDescription.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    value = json['value'];
  }
}
//#endregion God

//#region Item
class ItemListRequest extends BaseRequest {
  Map<String, dynamic> toJson() => {};
}

class ItemRecomendedListRequest extends BaseRequest {
  late int godID;

  Map<String, dynamic> toJson() => {
      'godID': godID,
  };
}

class ItemListResponse extends BaseListResponse<ItemCard> {
  ItemListResponse.fromJson(Map<String, dynamic> json) {
    var list = json['items'];
    for (var element in list) {
      items.add(ItemCard.fromJson(element));
    }

    message = json['message'];
    success = json['success'];
  }
}

class ItemRecomendedListResponse extends BaseListResponse<ItemCard> {
  ItemRecomendedListResponse.fromJson(Map<String, dynamic> json) {
    var list = json['items'];
    for (var element in list) {
      items.add(ItemCard.fromJson(element));
    }

    message = json['message'];
    success = json['success'];
  }
}

class ItemCard {
  late int itemID;
  late int childItemID;
  late String name;
  late String url;
  late String costText = '';
  late int cost;
  late String? description;
  late String? descriptionSecundary;
  late int tier;
  late List<String> childUrls = [];
  late List<ItemCardDescription> itemCardDescriptions = [];

  ItemCard.fromJson(Map<String, dynamic> json) {
    itemID = json['itemID'];
    childItemID = json['childItemID'];
    name = json['name'];
    url = json['url'];
    cost = json['cost'];
    description = json['description'];
    descriptionSecundary = json['descriptionSecundary'];
    tier = json['tier'];

    var list = json['itemCardDescriptions'];
    for (var element in list){
      itemCardDescriptions.add(ItemCardDescription.fromJson(element));
    }
  }
}

class ItemCardDescription {
  late String description;
  late String value;

  ItemCardDescription.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    value = json['value'];
  }
}
//#endregion Item