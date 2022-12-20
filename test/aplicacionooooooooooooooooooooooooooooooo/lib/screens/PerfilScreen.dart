import 'package:aplicacionooooooooooooooooooooooooooooooo/providers/usario_provider.dart';
import 'package:aplicacionooooooooooooooooooooooooooooooo/share_preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  @override
  void initState() {
    _ini();
    super.initState();
  }

  _ini() async {
    final userInfo = await Provider.of<UsuarioProvider>(context, listen: false);
    userInfo.id_usuario = Preferences.id_usuario;
    userInfo.nombre = Preferences.nombre;
    userInfo.foto = Preferences.foto;
    userInfo.correo = Preferences.correo;
    userInfo.telefono = Preferences.telefono;
    userInfo.direccion = Preferences.telefono;
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UsuarioProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Perfil"),
        ),
        body: Container(
          color: Color.fromARGB(255, 9, 30, 61),
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(height: 15),
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                          width: 4,
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(userInfo.foto),
                        )),
                  ),
                  SizedBox(height: 30),
                  Text(
                    userInfo.nombre,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "correo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 128, 126, 126),
                        fontSize: 30),
                  ),
                  Text(
                    userInfo.correo,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 30),
                  Text(
                    "direccion",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 128, 126, 126),
                        fontSize: 30),
                  ),
                  Text(
                    userInfo.direccion,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "telefono",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 128, 126, 126),
                        fontSize: 30),
                  ),
                  SizedBox(height: 20),
                  Text(
                    userInfo.telefono,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  SizedBox(height: 20),
                ],
              )
            ],
          ),
        ));
  }
}
