import 'package:flutter/material.dart';
import 'package:itemlol/model/Item.dart';
import 'package:itemlol/screens/item_detail.dart';
import 'dart:convert' show utf8;

import 'package:itemlol/utils/global_scaffold.dart';

class MyCard extends StatelessWidget {
  List<Item> itens = List();
  var index;

  MyCard(this.itens, this.index);

  void show() {
    final snackBar = SnackBar(content: Text("Esse item não compoe outros"));
    GlobalScaffold.instance.showSnack(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (itens[index].into != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return ItemDetail(itens[index]);
            }),
          );
        } else {
          show();
        }
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(itens[index].image),
                    ),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      width: 2.0,
                    )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 230,
                    child: Text(
                      utf8.decode(itens[index].name.codeUnits),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: 230,
                    child: Text(
                      utf8.decode(
                        itens[index].description.codeUnits,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Text(
                  "Valor: ${itens[index].goldBase}",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
