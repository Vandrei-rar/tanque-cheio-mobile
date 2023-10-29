// import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class User {
  final String email;
  final String token;

  User({required this.email, required this.token});
}

Future<User?> loginUser(String email, String password) async {
  final response = await http.post(
    Uri.parse('http://3.139.87.117:3333/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final String token = data['token'];

    // Salvar o token e o email do usuário no SharedPreferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    prefs.setString('email', email);

    return User(email: email, token: token);
} else if (response.statusCode == 401) {
    final Map<String, dynamic> errorData = json.decode(response.body);
    final String errorMessage = errorData['message']; // Suponha que o servidor envia uma mensagem de erro com a chave 'message'

    throw Exception('Failed to login: $errorMessage');
} else {
    // ('Credenciais estão erradas');
}

}
