
import 'package:aplicacionooooooooooooooooooooooooooooooo/providers/usario_provider.dart';
import 'package:aplicacionooooooooooooooooooooooooooooooo/screens/AgregarModuloScreen.dart';
import 'package:aplicacionooooooooooooooooooooooooooooooo/screens/EditarModuloScreen.dart';
import 'package:aplicacionooooooooooooooooooooooooooooooo/screens/LoginScreen.dart';
import 'package:aplicacionooooooooooooooooooooooooooooooo/screens/MenuScreen.dart';
import 'package:aplicacionooooooooooooooooooooooooooooooo/screens/ModuloScreen.dart';
import 'package:aplicacionooooooooooooooooooooooooooooooo/screens/PerfilScreen.dart';
import 'package:aplicacionooooooooooooooooooooooooooooooo/share_preferences/preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UsuarioProvider>(create: (_) => UsuarioProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: Preferences.logeado ? '/menu' : '/login',
      routes: {
        '/login': (_) => LoginScreen(),
        '/menu': (_) => MenuScreen(),
        '/perfil': (_) => const PerfilScreen(),
        '/modulo': (_) => const ModuloScreen(),
        '/add_modulo': (_) => const AgregarModuloScreen(),
        '/edit_modulo': (_) => EditarModulo(),
      },
    );
  }
}
