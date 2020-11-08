import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itemlol/screens/lista_itens.dart';
import 'package:itemlol/utils/global_scaffold.dart';

void main() async {
  runApp(MaterialApp(
    builder: (context, child) {
      return Scaffold(
        key: GlobalScaffold.instance.scaffKey,
        body: child,
      );
    },
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    home: ListaItens(),
  ));
}
