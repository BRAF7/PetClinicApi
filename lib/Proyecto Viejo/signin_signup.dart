import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

void signUp() async {
  Uri url = Uri.parse("http://localhost:18081/user/owner/signup");

  Future<String> postData() async {
    String email = "mar@mar.com";
    String password = "Mar";
    String rol = "Owner";
    String nombre = "Teresa";
    String telefono = "888";
    String direccion = "Tuxtla";
    Map data = {
      "email": email,
      "password": password,
      "rol": rol,
      "nombre": nombre,
      "telefono": telefono,
      "direccion": direccion,
    };
    String jsonObject = json.encode(data);
    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonObject);
    print(response.body);

    return response.body;
  }

  postData();
}

Future signIn(email, password) async {
  Uri url = Uri.parse("http://10.0.2.2:18081/user/login");

  Map data = {
    "email": email,
    "password": password,
  };

  String jsonObject = json.encode(data);
  var response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonObject);
  // print(response.body);
  if (response.body.isNotEmpty) {
    var responseBody = json.decode(response.body);

    var token = responseBody["token"];

    return token;
  }
  return null;
}
