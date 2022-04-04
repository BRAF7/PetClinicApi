import 'package:prueba_api_rest/Citas/Model/cita_model.dart';
import 'package:prueba_api_rest/Citas/Repository/citas_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListCitasRepository implements CitasRepository {
  static const String URL = "http://10.0.2.2:9999";

  @override
  Future<String> deleteCitaList(CitaModel cita) async {
    String url = '${URL}/cita/delete';

    int? idCita = cita.idCita;
    var result = "falso";
    Map data = {
      'idCita': idCita.toString(),
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
  Future<List<CitaModel>> getCitaList() async {
    List<CitaModel> listCita = [];
    Uri url = Uri.parse('${URL}/listCita');
    final respuesta = await http.get(url);
    var info = json.decode(respuesta.body);
    for (var item = 0; item < info.length; item++) {
      listCita.add(CitaModel.fromJson(info[item]));
    }
    return listCita;
  }

  @override
  Future<List<CitaModel>> postCitaList(CitaModel owner) {
    // TODO: implement postCitaList
    throw UnimplementedError();
  }

  @override
  Future<List<CitaModel>> addCita(CitaModel model) async {
    List<CitaModel> listCita = [];
    String url = '${URL}/cita/add';

    String? fecha = model.fecha;
    String? hora = model.hora;
    String? tipoServicio = model.tipoServicio;
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

    return listCita;
  }

  @override
  Future<String> editCita(CitaModel model) async {
    String url = '${URL}/cita/update';

    int? idCita = model.idCita;
    String? fecha = model.fecha;
    String? hora = model.hora;
    String? tipoServicio = model.tipoServicio;
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
}
