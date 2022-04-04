import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

void main() async {
  
}

void getListPets() async {
  Uri url = Uri.parse('http://localhost:9998/listMascotas');
  final respuesta = await http.get(url);
  var info = json.decode(respuesta.body);
  print(info[0]['nombre']);
}

void getPetById(int idPet) async {
  // getPetById(idPet);
  int idPet = 1;
  Uri url = Uri.parse('http://localhost:9998/mascotaConDuenio/${idPet}');
  final respuesta = await http.get(url);
  var info = json.decode(respuesta.body);
  print(info);
}

void addPet() async {
  String url = 'http://localhost:9998/mascota/add';

  Future<String> postData() async {
    String nombre = "Mar";
    String petType = "Dobberman";
    int idDuenio = 1;
    int idCita = 1;
    int idMedicamento = 1;
    String fechaIngreso = "02/04/2022";
    String razon = "Dolor de cabeza";
    Map data = {
      "nombre": nombre,
      "tipo": petType,
      "idDuenio": idDuenio.toString(), 
      "idCita": idCita.toString(),
      "idMedicamento": idMedicamento.toString(),
      "fechaIngreso": fechaIngreso,
      "razon": razon,
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
void updatePet() async {
  String url = 'http://localhost:9998/mascota/update';

  Future<String> postData() async {
    int idMascota = 1;
    String nombre = "Mar";
    String petType = "Dobberman";
    int idDuenio = 1;
    int idCita = 1;
    int idMedicamento = 1;
    String fechaIngreso = "02/04/2022";
    String razon = "Dolor de cabeza";
    Map data = {
      "idMascota" : idMascota.toString(),
      "nombre": nombre,
      "tipo": petType,
      "idDuenio": idDuenio.toString(), 
      "idCita": idCita.toString(),
      "idMedicamento": idMedicamento.toString(),
      "fechaIngreso": fechaIngreso,
      "razon": razon,
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

void deletePet() {
  String url = 'http://localhost:9998/mascota/delete';

    Future<String> postData() async {
    int idMascota = 2;
    Map data = {
      "idMascota" : idMascota.toString(),
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
