import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static bool _logeado = false;
  static int _id_usuario = 0;
  static String _nombre = "";
  static String _foto = "";
  static String _correo = "";
  static String _direccion = "";
  static String _telefono = "";

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //id
  static int get id_usuario {
    return _prefs.getInt('id_usuario') ?? _id_usuario;
  }

  static set id_usuario(int value) {
    _id_usuario = value;
    _prefs.setInt('id_usuario', value);
  }

  //nombre
  static String get nombre {
    return _prefs.getString('nombre') ?? _nombre;
  }

  static set nombre(String value) {
    _nombre = value;
    _prefs.setString('nombre', value);
  }

  //url
  static String get foto {
    return _prefs.getString('foto') ?? _foto;
  }

  static set foto(String value) {
    _foto = value;
    _prefs.setString('foto', value);
  }

  //logueado
  static bool get logeado {
    return _prefs.getBool('logeado') ?? _logeado;
  }

  static set logeado(bool value) {
    _logeado = value;
    _prefs.setBool('logeado', value);
  }

  //telefono
  static String get telefono {
    return _prefs.getString('telefono') ?? _telefono;
  }

  static set telefono(String value) {
    _telefono = value;
    _prefs.setString('telefono', value);
  }

  //correo
  static String get correo {
    return _prefs.getString('correo') ?? _correo;
  }

  static set correo(String value) {
    _correo = value;
    _prefs.setString('correo', value);
  }

  //direccion
  static String get direccion {
    return _prefs.getString('direccion') ?? _direccion;
  }

  static set direccion(String value) {
    _direccion = value;
    _prefs.setString('direccion', value);
  }
}
