import 'package:flutter/cupertino.dart';

class UsuarioProvider with ChangeNotifier {
  int _id_usuario = 0;
  String _nombre = "";
  String _correo = "";
  String _direccion = "";
  String _telefono = "";
  String _foto = "";

  int get id_usuario => _id_usuario;
  set id_usuario(int id_usuario) {
    this._id_usuario = id_usuario;
    notifyListeners();
  }

  String get nombre => _nombre;
  set nombre(String nombre) {
    this._nombre = nombre;
    notifyListeners();
  }

  String get direccion => _direccion;
  set direccion(String direccion) {
    this._direccion = direccion;
    ;
    notifyListeners();
  }

  String get telefono => _telefono;
  set telefono(String telefono) {
    this._telefono = telefono;
    notifyListeners();
  }

  String get correo => _correo;
  set correo(String correo) {
    this._correo = correo;
    notifyListeners();
  }

  String get foto => _foto;
  set foto(String foto) {
    this._foto = foto;
    notifyListeners();
  }
}
