import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:itemlol/model/Item.dart';

class ApiHttp{
  Item item;

  Future<List<Item>>getApiDataItens() async {
  List<Item>itens = List();
    var api = "http://ddragon.leagueoflegends.com/cdn/10.22.1/data/pt_BR/item.json";
    var jsonResponse = await http.get(api);
    var mapItens = json.decode(jsonResponse.body);
    mapItens["data"].forEach((key, value){
    item = Item.fromApi(value);
    itens.add(item);
    });
    return itens;
  }
}