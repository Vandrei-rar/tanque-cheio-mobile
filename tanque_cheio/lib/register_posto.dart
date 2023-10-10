import 'package:flutter/material.dart';
import 'package:tanque_cheio/widgets/cadastro_header.dart';  // Importe o widget criado

class RegisterPostoPage extends StatelessWidget {
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
              // Utilize o widget CadastroHeader
              CadastroHeader(
                title: 'Crie seu Cadastro',
                description:
                    'Para darmos início precisamos saber, qual tipo de usuário você é?',
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Implemente a ação para tipo de cadastro "Posto de Gasolina"
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
                          child: Image.asset(
                            'assets/imgs/icone-tipo-posto.png',
                            height: 100,
                            width: 100,
                          ),
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
              // Restante do código para o tipo "Condutor"
            ],
          ),
        ),
      ),
    );
  }
}
