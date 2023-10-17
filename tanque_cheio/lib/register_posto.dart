import 'package:flutter/material.dart';

class RegistroPosto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: FloatingActionButton(
          onPressed: () {
            // Implemente a ação de voltar para a tela anterior
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
          backgroundColor: Color(0xFFC20606),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),  // Adicionando espaço abaixo do texto
                    child: Text(
                      'Crie seu Cadastro',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontFamily: 'MADE TOMMY',
                        fontSize: 25.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'Para criar sua conta, insira alguns dados necessários por favor',
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
                  labelText: 'Nome',
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
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Telefone',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                ),
                // Adicione aqui a lógica para aplicar a máscara
              ),
            ],
          ),
        ),
      ),
    );
  }
}
