import 'package:aplicacionooooooooooooooooooooooooooooooo/share_preferences/preferences.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Color.fromARGB(255, 9, 30, 61),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Menú",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 80,
              ),
              MaterialButton(
                elevation: 10,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                color: Colors.green,
                child: Text(
                  "Perfil",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/perfil');
                },
              ),
              SizedBox(
                height: 60,
              ),
              MaterialButton(
                elevation: 10,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                color: Colors.blue[600],
                child: Text(
                  "Modulos",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/modulo');
                },
              ),
              SizedBox(
                height: 60,
              ),
              MaterialButton(
                elevation: 10,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                color: Colors.red[900],
                child: Text(
                  "Salir",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Preferences.logeado = false;
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
