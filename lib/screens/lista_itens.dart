import 'package:flutter/material.dart';
import 'package:itemlol/api/itens_lol.dart';
import 'package:itemlol/model/Item.dart';
import 'dart:convert' show utf8;

import 'package:itemlol/screens/item_detail.dart';

class ListaItens extends StatelessWidget {
  List<Item> itens = List();
  ApiHttp api = ApiHttp();

  getItens() async {
    itens = await api.getApiDataItens();
    print("rodando");
  }

  @override
  Widget build(BuildContext context) {
    getItens();
    return Scaffold(
      backgroundColor: Color.fromRGBO(52, 52, 52, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(52, 52, 52, 1),
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo2.png',
          height: 55,
        ),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      child: ListView.separated(
        itemCount: itens.length,
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.amber,
          );
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ItemDetail(itens[index],);
              }),);
            },
            child: ListTile(
              leading: ClipOval(
                child: Image.network(itens[index].image),
              ),
              title: Text(
                utf8.decode(itens[index].name.codeUnits),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                utf8.decode(itens[index].description.codeUnits),
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              isThreeLine: true,
              trailing: Text(
                "Valor: ${itens[index].goldBase}",
                style: TextStyle(
                  color: Colors.amber,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
