import 'package:flutter/material.dart';
import 'package:itemlol/model/Item.dart';
import 'dart:convert' show utf8;

import 'package:transparent_image/transparent_image.dart';

class ItemDetail extends StatelessWidget {
  Item item;

  List<String> itensCompostos = List();

  ItemDetail(this.item);
  @override
  Widget build(BuildContext context) {
    //pegar todos os itens relacionados
    item.into.forEach((element) {
      itensCompostos.add(item.urlImages + element + '.png');
    });

    return Scaffold(
      backgroundColor: Color.fromRGBO(52, 52, 52, 1),
      body: _body(),
    );
  }

  _body() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            Center(
              child: Image.network(item.image),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              utf8.decode(item.name.codeUnits),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              utf8.decode(item.description.codeUnits),
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Divider(
              color: Colors.amber,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: itensCompostos.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: itensCompostos[index],
                          width: 150,
                          height: 150,
                          fit: BoxFit.scaleDown,
                        );
                      
                    
                  
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
