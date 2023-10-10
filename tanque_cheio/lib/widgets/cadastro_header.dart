import 'package:flutter/material.dart';

class CadastroHeader extends StatelessWidget {
  final String title; // Adicionando parâmetro 'title'
  final String description; // Adicionando parâmetro 'description'

  const CadastroHeader({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title, // Usando o título fornecido
          style: TextStyle(
            color: Color(0xFF000000),
            fontFamily: 'MADE TOMMY',
            fontSize: 25.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        SizedBox(height: 16.0),
        Text(
          description, // Usando a descrição fornecida
          style: TextStyle(
            color: Color(0xFF828282),
            fontFamily: 'MADE TOMMY',
            fontSize: 15.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}
