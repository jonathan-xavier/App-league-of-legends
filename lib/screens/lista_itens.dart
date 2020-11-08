import 'package:flutter/material.dart';
import 'package:itemlol/api/itens_lol.dart';
import 'package:itemlol/components/card_item.dart';
import 'package:itemlol/model/Item.dart';

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
      appBar: AppBar(
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
      child: ListView.builder(
        itemCount: itens.length,
        itemBuilder: (context, index) {
          return MyCard(itens, index);
        },
      ),
    );
  }
}
