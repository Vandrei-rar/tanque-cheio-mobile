import 'package:flutter/material.dart';
import 'package:tanque_cheio/register_posto.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crie seu Cadastro'),
        backgroundColor: Color(0xFFC20606),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 102.0, 16.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
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
              SizedBox(height: 16.0),
              Text(
                'Para darmos início precisamos saber, qual tipo de usuário você é?',
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
              ElevatedButton(
                  onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistroPosto()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFC20606),
                  padding: EdgeInsets.all(0),
                  minimumSize: Size(294, 163),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  shadowColor: Colors.black.withOpacity(0.25),
                  elevation: 5.0,
                ),
                child: Container(
                  width: 294,
                  height: 163,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset('assets/imgs/icone-tipo-posto.png', height: 100, width: 100),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Posto de Gasolina',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  //a ação para tipo de cadastro "Condutor"
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFC20606),
                  padding: EdgeInsets.all(0),
                  minimumSize: Size(294, 163),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  shadowColor: Colors.black.withOpacity(0.25),
                  elevation: 5.0,
                ),
                child: Container(
                  width: 294,
                  height: 163,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset('assets/imgs/icone-tipo-condutor.png', height: 100, width: 100),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Condutor',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
