import 'package:flutter/material.dart';
import 'package:parcial/pages/perfilUsuario_page.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
       initialRoute: PerfilUsuarioPage.id,
      routes: {
        PerfilUsuarioPage.id : (context) => PerfilUsuarioPage(),
      },
    );
  }
}
