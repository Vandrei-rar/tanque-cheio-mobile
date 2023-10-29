import 'package:flutter/material.dart';

class CadastroHeader extends StatelessWidget {
  final String title;
  final String description;

  const CadastroHeader({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
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
          description,
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
