import 'dart:convert';

import 'package:aplicacionooooooooooooooooooooooooooooooo/bd.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ModuloScreen extends StatefulWidget {
  const ModuloScreen({Key? key}) : super(key: key);

  @override
  State<ModuloScreen> createState() => _ModuloScreenState();
}

class _ModuloScreenState extends State<ModuloScreen> {
  Map<String, dynamic>? data;
  List moduloData = [];

  /////////// TRAYENDO TODA LA DATA GENERAL

  getData() async {
    final url = Uri.parse(url_bd + 'api/modulo/');

    final response = await http.get(url);

    this.data = json.decode(response.body);
    print("aqui");
    print(response);
    print(data);

    setState(() {
      this.moduloData = data!['result'];
      print("EN SETSTATE");
      print(data!['respuesta']);
    });
    print("RESPONSE BODY");
    print(response.body);
  }
  /////////// ELIMINANDO REGISTRO

  Future<http.Response> deleteData(int id) async {
    final url = Uri.parse(url_bd + 'api/modulo/delete/${id}');

    final response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    getData();
    return response;
  }

  @override
  void initState() {
    super.initState();
    getData();
    print("INIT STATE EN MAIN.DART !!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
        centerTitle: true,
        actions: [
          PopupMenuButton<int>(
              onSelected: (item) => onselected(context, item),
              itemBuilder: (context) => [
                    PopupMenuItem<int>(value: 0, child: Text("AGREGAR")),
                  ])
        ],
      ),
      body: ListView.builder(
          itemCount: moduloData.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              // key: ObjectKey(postsData[index]),
              key: UniqueKey(),
              onDismissed: (direction) {
                setState(() {
                  deleteData(moduloData[index]['id']);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                          Text('${moduloData[index]['nombre']} Eliminado !')));
                });
              },
              child: GestureDetector(
                onTap: () {
                  print("ESTE ES EL OBJETO SELECCIONADO: ");
                  print("${moduloData[index]}");
                  final moduloobjeto = moduloData[index];
                  print(moduloobjeto);
                  Navigator.pushNamed(context, '/edit_modulo',
                      arguments: moduloobjeto);
                },
                child: Card(
                    elevation: 15,
                    child: ListTile(
                        title: Center(
                            child: Text("${moduloData[index]['nombre']}")),
                        subtitle: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text("${moduloData[index]['descripcion']}"),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                                "${moduloData[index]['fecha_inicio']} - ${moduloData[index]['fecha_fin']}")
                          ],
                        ))),
              ),
            );
          }),
    );
  }

  void onselected(BuildContext context, int item) {
    switch (item) {
      case 0:
        print("AGREGANDO ...");
        Navigator.pushNamed(context, '/add_modulo');
        break;

      default:
    }
  }
}
