import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'register_page.dart';
import 'home.dart';
import 'home_main_posto.dart';
import 'widgets/api_login.dart';

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

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;
  TextEditingController emailController = TextEditingController(); // Controlador para o campo de e-mail
  TextEditingController senhaController = TextEditingController(); // Controlador para o campo de senha

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

void _login(BuildContext context) async {
  final email = emailController.text;
  final senha = senhaController.text;

  try {
    bool autenticacaoBemSucedida = await realizarAutenticacao(email, senha);

    if (autenticacaoBemSucedida) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeMainPosto()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Falha na autenticação. Verifique suas credenciais.'),
        ),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Erro: $e'), // Exibe a mensagem de erro capturada
      ),
    );
  }
}


Future<bool> realizarAutenticacao(String email, String senha) async {
  final response = await loginUser(email, senha);

  if (response != null) {
    // A resposta foi bem-sucedida
    return true;
  } else {
    // A resposta foi nula, indica uma falha na autenticaçãooo
    return false;
  }
}

  void _navigateToRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  void _home(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SliderScreen()),
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
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Acesse sua conta',
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontFamily: 'MADE TOMMY',
                    fontSize: 25.0,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
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
                  controller: emailController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Stack(
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
                      controller: senhaController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        labelStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                      ),
                      obscureText: _obscurePassword,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.black,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
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
                      // ação para "Esqueceu a senha"
                      _home(context);
                    },
                    style: TextButton.styleFrom(primary: Colors.red),
                    child: Text('Esqueceu a senha?'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
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
                ],
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
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 226, 226, 226), // Cor da sombra
                        offset: Offset(0, 2),
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Image.asset('assets/imgs/google.png'),
                    onPressed: () {
                      // Ação para acessar com o Google
                    },
                  ),
                ),
                SizedBox(width: 20.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 226, 226, 226), // Cor da sombra
                        offset: Offset(0, 2), 
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Image.asset('assets/imgs/facebook.png'),
                    onPressed: () {
                      // ação para acessar com o Facebook
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
