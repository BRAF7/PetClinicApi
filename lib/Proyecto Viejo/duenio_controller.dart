import 'dart:convert';
import 'package:http/http.dart' as http;

  // void main(){
  //   getListDuenios();
  // }

  Future getListDuenios() async {
  Uri url = Uri.parse('http://localhost:18080/listDuenios');
  final respuesta = await http.get(url);
  var info = json.decode(respuesta.body);
  return info;
}

void getByIdDuenio() async {
  int idDuenio = 1;
  Uri url = Uri.parse('http://localhost:18080/duenio/${idDuenio}');
  final respuesta = await http.get(url);
  var info = json.decode(respuesta.body);
  print(info);
}

void addDuenio() async {
  String url = 'http://localhost:18080/duenio/add';

  Future<String> postData() async {
    String nombre = "Mar";
    int telefono = 777;
    String direccion = "Tuxtla";
    String email = "Mar@mar.com";
    Map data = {
      'nombre': nombre,
      'telefono': telefono.toString(),
      'direccion': direccion,
      'email': email,
    };
    String jsonObject = json.encode(data);
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonObject);
    print(response.body);

    return response.body;
  }

  postData();
}

void updateDuenio() async {
  String url = 'http://localhost:18080/duenio/update';

  Future<String> postData() async {
    int id = 15;
    String nombre = "Teresa";
    int telefono = 777;
    String direccion = "Tuxtla";
    String email = "Mar@mar.com";
    Map data = {
      'idDuenio': id.toString(),
      'nombre': nombre,
      'telefono': telefono.toString(),
      'direccion': direccion,
      'email': email,
    };
    String jsonObject = json.encode(data);
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonObject);
    print(response.body);

    return response.body;
  }

  postData();
}

void deleteDuenio() {
  String url = 'http://localhost:18080/duenio/delete';

  Future<String> postData() async {
    int id = 27;
    Map data = {
      'idDuenio': id.toString(),
    };
    String jsonObject = json.encode(data);
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonObject);
    print(response.body);

    return response.body;
  }

  postData();
}
