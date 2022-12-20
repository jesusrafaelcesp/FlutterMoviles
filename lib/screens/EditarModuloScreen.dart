import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:integrador_jesus/bd.dart';
import 'package:integrador_jesus/model/modulo.model.dart';

class EditarModulo extends StatefulWidget {
  EditarModulo({Key? key}) : super(key: key);

  @override
  _EditarModuloState createState() => _EditarModuloState();
}

class _EditarModuloState extends State<EditarModulo> {
  String nombre = '';
  String descripcion = '';
  String fecha_inicio = '';
  String fecha_fin = '';
  List<ModuloModel> modulomodel = [];

  Future<http.Response> updatePost(ModuloModel modulos, int id) async {
    final url = Uri.parse(url_bd + 'api/modulo/update/${id}');

    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nombre': modulos.nombre,
        'descripcion': modulos.descripcion,
        'fecha_inicio': modulos.fechaFin,
        'fecha_fin': modulos.fechaInicio,
        'estado': "1",
      }),
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.body);
      print('A network error occurred');
    }

    this.modulomodel.add(modulos);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    //RECIBIENDO EL PARAMETRO ENVIADO
    final Map<String, dynamic> modulomodelobject =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text("ACTUALIZAR"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        children: [
          _nombre(modulomodelobject['nombre']),
          Divider(
            color: Colors.lightBlue,
            thickness: 0.5,
          ),
          _descripcion(modulomodelobject['descripcion']),
          Divider(
            color: Colors.lightBlue,
            thickness: 0.5,
          ),
          _fecha_inicio(modulomodelobject['fecha_inicio']),
          Divider(
            color: Colors.lightBlue,
            thickness: 0.5,
          ),
          _fecha_fin(modulomodelobject['fecha_fin']),
          Divider(
            color: Colors.lightBlue,
            thickness: 0.5,
          ),
          FloatingActionButton(
              child: Icon(Icons.update),
              onPressed: () async {
                print("EN EL ONPRESED !");
                print(this.nombre);
                print(this.descripcion);

                final moduloObjeto = new ModuloModel(
                    nombre: this.nombre,
                    descripcion: this.descripcion,
                    fechaInicio: this.fecha_inicio,
                    fechaFin: this.fecha_fin,
                    estado: "1");
                final dataEnviar =
                    await updatePost(moduloObjeto, modulomodelobject['id']);
                print(dataEnviar);
                Navigator.pushNamed(context, '/modulo');
              })
        ],
      ),
    );
  }

  Widget _nombre(String nombre) {
    // final _controller = new TextEditingController(text: 'Initial value');
    return TextFormField(
      initialValue: nombre,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Nombre',
          icon: Icon(Icons.title)),

      //CAPTURAR EL VALOR DEL INPUT
      onChanged: (value) {
        setState(() {
          this.nombre = value;
        });
      },
    );
  }

  Widget _descripcion(String descripcion) {
    // final _controller = new TextEditingController(text: 'Initial value');
    return TextFormField(
      initialValue: descripcion,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Descripcion',
          icon: Icon(Icons.title)),

      //CAPTURAR EL VALOR DEL INPUT
      onChanged: (value) {
        setState(() {
          this.descripcion = value;
        });
      },
    );
  }

  Widget _fecha_inicio(String fecha_inicio) {
    // final _controller = new TextEditingController(text: 'Initial value');
    return TextFormField(
      initialValue: fecha_inicio,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Fecha Inicio',
          icon: Icon(Icons.date_range)),

      //CAPTURAR EL VALOR DEL INPUT
      onChanged: (value) {
        setState(() {
          this.fecha_inicio = value;
        });
      },
    );
  }

  Widget _fecha_fin(String fecha_fin) {
    // final _controller = new TextEditingController(text: 'Initial value');
    return TextFormField(
      initialValue: fecha_fin,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Fecha Fin',
          icon: Icon(Icons.date_range)),

      //CAPTURAR EL VALOR DEL INPUT
      onChanged: (value) {
        setState(() {
          this.fecha_fin = value;
        });
      },
    );
  }
}
