import 'dart:convert';
import 'package:aplicacionooooooooooooooooooooooooooooooo/bd.dart';
import 'package:aplicacionooooooooooooooooooooooooooooooo/share_preferences/preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class User {
  String username = "";
  String password = "";
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var usuario = new User();
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: ListView(
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo.png",
                  width: 180,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white,
                        blurRadius: 10,
                        offset: Offset(0, 5))
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(81, 171, 216, 1)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "Buen día !!!",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                      child: TextField(
                        autofocus: false,
                        decoration: InputDecoration(
                            hintText: "Usuario",
                            prefixIcon: Icon(Icons.person),
                            contentPadding: EdgeInsets.all(10),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 18),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2))),
                        onChanged: (value) => usuario.username = value,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                      child: TextField(
                        obscureText: true,
                        autofocus: false,
                        decoration: InputDecoration(
                            hintText: "Contraseña",
                            prefixIcon: Icon(Icons.security),
                            contentPadding: EdgeInsets.all(10),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 18),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2))),
                        onChanged: (value) => usuario.password = value,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    InkWell(
                      onTap: () {
                        print(usuario.username);
                        print(usuario.password);

                        loginPost() async {
                          List perfilData = [];
                          Map<String, dynamic>? data;
                          String yourToken = "";
                          var userData = {};
                          final response = await http.post(
                            Uri.parse(url_bd + 'api/auth/'),
                            headers: <String, String>{
                              'Content-Type': 'application/json; charset=UTF-8',
                            },
                            body: jsonEncode(<String, String>{
                              'user': usuario.username,
                              'password': usuario.password,
                            }),
                          );
                          if (response.statusCode == 200) {
                            print('Exito al conectarte!');
                            data = json.decode(response.body);
                            yourToken = data!["accessToken"];
                            Map<String, dynamic> decodedToken =
                                JwtDecoder.decode(yourToken);
                            userData = decodedToken["user"];
                            Preferences.id_usuario = userData['idusuario'];
                            Preferences.nombre = userData['nombre'];
                            Preferences.foto = userData['foto'];
                            Preferences.correo = userData['correo'];
                            Preferences.direccion = userData['direccion'];
                            Preferences.telefono = userData['telefono'];
                            print("valores de preferences despues");
                            print(Preferences.id_usuario);
                            print(Preferences.nombre);
                            print(Preferences.foto);
                            print(Preferences.correo);
                            print(Preferences.direccion);
                            print(Preferences.telefono);

                            Preferences.logeado = true;
                          } else {
                            print('A network error occurred');
                          }
                          return response;
                        }

                        loginPost().then((value) =>
                            Navigator.pushReplacementNamed(context, '/menu'));
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                "Ingresar",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(81, 171, 216, 1),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
