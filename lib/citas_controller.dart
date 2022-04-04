import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

void main() async {
  deleteCita();
}

void getListCitas() async {
  Uri url = Uri.parse('http://localhost:9999/listCita');
  final respuesta = await http.get(url);
  var info = json.decode(respuesta.body);
  print(info);
}

void citaById() async {
  int idCita = 16;
  Uri url = Uri.parse('http://localhost:9999/MascotaConCita/${idCita}');
  final respuesta = await http.get(url);
  var info = json.decode(respuesta.body);
  print(info);
}

void addCita() async {
  String url = 'http://localhost:9999/cita/add';

  Future<String> postData() async {
    String fecha = "02/04/2022";
    String hora = "2:40PM"; 
    String tipoServicio = "Sobadita de pancita de new";
    Map data = {
      'fecha': fecha,
      'hora': hora,
      'tipoServicio': tipoServicio,
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
void updateCita() async {
  String url = 'http://localhost:9999/cita/update';

  Future<String> postData() async {
    int idCita = 14;
    String fecha = "02/04/2022";
    String hora = "2:40PM"; 
    String tipoServicio = "Sobadita de pancita de new";
    Map data = {
      'idCita': idCita.toString(),
      'fecha': fecha,
      'hora': hora,
      'tipoServicio': tipoServicio,
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
void deleteCita() async {
  String url = 'http://localhost:9999/cita/delete';

  Future<String> postData() async {
    int idCita = 15;
    Map data = {
      'idCita': idCita.toString(),
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