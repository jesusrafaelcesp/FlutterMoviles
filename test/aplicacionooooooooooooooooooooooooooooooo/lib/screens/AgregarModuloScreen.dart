import 'dart:convert';

import 'package:aplicacionooooooooooooooooooooooooooooooo/bd.dart';
import 'package:aplicacionooooooooooooooooooooooooooooooo/model/modulo.model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AgregarModuloScreen extends StatefulWidget {
  const AgregarModuloScreen({Key? key}) : super(key: key);

  @override
  State<AgregarModuloScreen> createState() => _AgregarModuloScreenState();
}

class _AgregarModuloScreenState extends State<AgregarModuloScreen> {
  int id = 0;
  String nombre = "";
  String descripcion = "";
  String fecha_ini = "";
  String fecha_fin = "";
  List<ModuloModel> modulomodel = [];

  Future<http.Response> createModulo(ModuloModel modulos) async {
    final response = await http.post(
      Uri.parse(url_bd + 'api/modulo/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nombre': modulos.nombre,
        'descripcion': modulos.descripcion,
        'fecha_inicio': modulos.fechaInicio,
        'fecha_fin': modulos.fechaFin,
        'estado': modulos.estado,
      }),
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('A network error occurred');
    }

    this.modulomodel.add(modulos);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REGISTRAR"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        children: [
          _nombre(),
          Divider(
            color: Colors.lightBlue,
            thickness: 0.5,
          ),
          _descripcion(),
          Divider(
            color: Colors.lightBlue,
            thickness: 0.5,
          ),
          _fecha_ini(),
          Divider(
            color: Colors.lightBlue,
            thickness: 0.5,
          ),
          _fechafin(),
          Divider(
            color: Colors.lightBlue,
            thickness: 0.5,
          ),
          FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () async {
                final moduloObjeto = new ModuloModel(
                    nombre: this.nombre,
                    descripcion: this.descripcion,
                    fechaInicio: this.fecha_ini,
                    fechaFin: this.fecha_fin,
                    estado: "1");
                final dataEnviar = await createModulo(moduloObjeto);
                print(dataEnviar);
                Navigator.pushNamed(context, '/modulo');
              })
        ],
      ),
    );
  }

  Widget _nombre() {
    return TextField(
      //al momento de ingresar al formulario, se enfocará en el input
      // autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //hintext es como el Placeholder
          // hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          // suffixIcon: Icon(Icons.fingerprint),
          icon: Icon(Icons.title)),
      //CAPTURAR EL VALOR DEL INPUT
      onChanged: (value) {
        setState(() {
          this.nombre = value;
        });
      },
    );
  }

  Widget _descripcion() {
    return TextField(
      //al momento de ingresar al formulario, se enfocará en el input
      // autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //hintext es como el Placeholder
          // hintText: 'Nombre de la persona',
          labelText: 'Descripcion',
          // suffixIcon: Icon(Icons.fingerprint),
          icon: Icon(Icons.description)),
      //CAPTURAR EL VALOR DEL INPUT
      onChanged: (value) {
        setState(() {
          this.descripcion = value;
        });
      },
    );
  }

  Widget _fecha_ini() {
    return TextField(
      //al momento de ingresar al formulario, se enfocará en el input
      // autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //hintext es como el Placeholder
          // hintText: 'Nombre de la persona',
          labelText: 'Fecha de Inicio',
          // suffixIcon: Icon(Icons.fingerprint),
          icon: Icon(Icons.date_range)),
      //CAPTURAR EL VALOR DEL INPUT
      onChanged: (value) {
        setState(() {
          this.fecha_ini = value;
        });
      },
    );
  }

  Widget _fechafin() {
    return TextField(
      //al momento de ingresar al formulario, se enfocará en el input
      // autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //hintext es como el Placeholder
          // hintText: 'Nombre de la persona',
          labelText: 'Fecha de Fin',
          // suffixIcon: Icon(Icons.fingerprint),
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
