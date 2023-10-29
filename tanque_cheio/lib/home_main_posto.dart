import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register_page.dart';
import 'main.dart';


class HomeMainPosto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC20606),
        title: Text('TanqueCheio'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout), // Ícone de logout
            onPressed: () {
              // lógica de logout aqui
              _logout(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bem-vindo à tela principal do posto!',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  void _logout(BuildContext context) async {
    // lógica de logout, limpando dados de autenticação
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('email');

    // Redirecionar o usuário de volta à tela de login (main.dart)
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  }
}
