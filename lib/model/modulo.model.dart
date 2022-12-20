// To parse this JSON data, do
//
//     final documentResponse = documentResponseFromMap(jsonString);

import 'dart:convert';

class ModuloModel {
  ModuloModel({
    this.id,
    required this.nombre,
    required this.descripcion,
    required this.fechaInicio,
    required this.fechaFin,
    required this.estado,
  });

  int? id;
  String nombre;
  String descripcion;
  String fechaInicio;
  String fechaFin;
  String estado;

  factory ModuloModel.fromJson(String str) =>
      ModuloModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModuloModel.fromMap(Map<String, dynamic> json) => ModuloModel(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        fechaInicio: json["fecha_inicio"],
        fechaFin: json["fecha_fin"],
        estado: json["estado"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "fecha_inicio": fechaInicio,
        "fecha_fin": fechaFin,
        "estado": estado,
      };
}
