import 'package:prueba_api_rest/Mascotas/mascota_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './mascota_repository.dart';

class ListMascotasRepository implements MascotaRepository {
  static const String URL = "http://10.0.2.2:9998";

  @override
  Future<String> deleteMascotaModelList(MascotaModel mascota) async {
    String url = '${URL}/mascota/delete';
    var result = "false";
    int? idMascota = mascota.idMascota;
    Map data = {
      "idMascota": idMascota.toString(),
    };
    String jsonObject = json.encode(data);
    var response = await http
        .post(Uri.parse(url),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonObject)
        .then((value) {
      return result = "true";
    });
    return result;
  }

  @override
  Future<List<MascotaModel>> getMascotaModelList() async {
    List<MascotaModel> listMascotas = [];
    Uri url = Uri.parse('${URL}/listMascotas');
    final respuesta = await http.get(url);
    var info = json.decode(respuesta.body);
    for (var item = 0; item < info.length; item++) {
      listMascotas.add(MascotaModel.fromJson(info[item]));
    }
    return listMascotas;
  }

  @override
  Future<List<MascotaModel>> addMascota(MascotaModel mascota) async {
    String url = 'http://localhost:9998/mascota/add';
    List<MascotaModel> listMascotas = [];

    String? nombre = mascota.nombre;
    String? petType = mascota.tipo;
    String? idDuenio = mascota.idDuenio;
    String? idCita = mascota.idCita;
    String? idMedicamento = mascota.idMedicamento;
    String? fechaIngreso = mascota.fechaIngreso;
    String? razon = mascota.razon;
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
    return listMascotas;
  }

  @override
  Future<String> editMascota(MascotaModel mascota) async {
    String url = 'http://localhost:9998/mascota/update';

    int? idMascota = mascota.idMascota;
    String? nombre = mascota.nombre;
    String? petType = mascota.tipo;
    String? idDuenio = mascota.idDuenio;
    String? idCita = mascota.idCita;
    String? idMedicamento = mascota.idMedicamento;
    String? fechaIngreso = mascota.fechaIngreso;
    String? razon = mascota.razon;
    Map data = {
      "idMascota": idMascota.toString(),
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
}
