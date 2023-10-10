import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';  // Importe o pacote gestures.dart
import 'register_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFC20606),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFFFC700)),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  void _login(BuildContext context) {
    // Implemente a ação para o botão de entrar
    // Aqui você colocará a lógica de autenticação
  }

  void _navigateToRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/imgs/bannerlogin-v2.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(11.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 3.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(11.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 3.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                    ),
                    obscureText: true,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: () {
                    // Implemente a lógica para mostrar/ocultar a senha
                  },
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Checkbox(
                        value: false,
                        onChanged: (value) {},
                        checkColor: Colors.white,
                        activeColor: Colors.transparent,
                      ),
                    ),
                    Text(
                      'Lembrar acesso',
                      style: TextStyle(color: Color(0xFF828282)),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Implemente a ação para "Esqueceu a senha"
                  },
                  style: TextButton.styleFrom(primary: Colors.red),
                  child: Text('Esqueceu a senha?'),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _login(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFFC700),
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  shadowColor: Colors.grey[400],
                  elevation: 5.0,
                ),
                child: Text('Entrar'),
              ),
            ),
            SizedBox(height: 10.0),
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  text: 'Ainda não tem cadastro? ',
                  style: TextStyle(color: Color(0xFF828282)),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Cadastre-se',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _navigateToRegister(context);
                        },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('ou acesse com'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.ac_unit),
                  onPressed: () {
                    // Implemente a ação para acessar com o Google
                  },
                ),
                SizedBox(width: 20.0),
                IconButton(
                  icon: Icon(Icons.access_alarm),
                  onPressed: () {
                    // Implemente a ação para acessar com o Facebook
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// void main() => runApp(MyApp());
