class Item{
  String name;
  String description;
  String plainText;
  List<dynamic> into;
  String image;
  int goldBase;
  bool ispurchasable;
  int goldTotal;
  int goldSell;
  String urlImages = "http://ddragon.leagueoflegends.com/cdn/10.22.1/img/item/";

  Item.fromApi(Map<String,dynamic> map){
    this.name = map["name"];
    this.description = removeAllHtmlTags(map["description"]);
    this.plainText = map["plainText"];
    this.into = map["into"];
    this.image = urlImages + map["image"]["full"];
    this.goldBase = map["gold"]["base"];
    this.ispurchasable = map["gold"]["purchasable"];
    this.goldTotal = map["gold"]["total"];
    this.goldSell = map["gold"]["sell"];

  }
  //remove o html da api
  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(
      r"<[^>]*>",
      multiLine: true,
      caseSensitive: true
    );

    return htmlText.replaceAll(exp, '');
  }
}