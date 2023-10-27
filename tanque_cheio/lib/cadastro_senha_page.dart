import 'package:flutter/material.dart';

class CadastroSenhaPage extends StatefulWidget {
  @override
  _CadastroSenhaPageState createState() => _CadastroSenhaPageState();
}

class _CadastroSenhaPageState extends State<CadastroSenhaPage> {
  TextEditingController senhaController = TextEditingController();
  TextEditingController repetirSenhaController = TextEditingController();

  bool senhasIguais = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastre sua Senha'),
        backgroundColor: Color(0xFFC20606),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Crie uma senha para sua conta',
              style: TextStyle(
                color: Color(0xFF000000),
                fontFamily: 'MADE TOMMY',
                fontSize: 20.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: senhaController,
              obscureText: true, // Para ocultar a senha
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: repetirSenhaController,
              obscureText: true, // Para ocultar a senha
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Repita a Senha',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Verifique se as senhas digitadas são iguais
                if (senhaController.text == repetirSenhaController.text) {
                  // Senhas iguais, você pode prosseguir
                  setState(() {
                    senhasIguais = true;
                  });
                } else {
                  // Senhas diferentes, mostre uma mensagem de erro
                  setState(() {
                    senhasIguais = false;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFFFC700),
                onPrimary: Colors.black,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Avançar', style: TextStyle(fontSize: 18.0)),
            ),
            if (senhasIguais == false)
              Text(
                'As senhas não coincidem. Tente novamente.',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16.0,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
