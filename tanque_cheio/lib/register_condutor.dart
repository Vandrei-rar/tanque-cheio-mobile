import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tanque_cheio/cadastro_senha_page.dart';

class RegistroCondutor extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();
  var maskFormatter = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Crie seu Cadastro'),
        backgroundColor: Color(0xFFC20606),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Para registrar o estabelecimento, insira alguns dados necessários por favor',
              style: TextStyle(
                color: Color(0xFF828282),
                fontFamily: 'MADE TOMMY',
                fontSize: 15.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Nome da Empresa',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'E-mail',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: phoneController,
              inputFormatters: [maskFormatter],
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Telefone',
                hintText: '(00) 12345-6789',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11.0),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CadastroSenhaPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFFFC700),
            onPrimary: Colors.black,
            minimumSize: Size(double.infinity, 50),
          ),
          child: Text('Avançar', style: TextStyle(fontSize: 18.0)),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
