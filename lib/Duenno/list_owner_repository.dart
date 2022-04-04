import 'dart:convert';
import 'package:http/http.dart' as http;

import 'owner_model.dart';
import 'repository.dart';

class ListOwnerRepository implements Repository {
  static const String URL = "http://10.0.2.2:18080";
  @override
  Future<String> deleteListOwnerList(ListOwner owner) async {
    String url = '${URL}/duenio/delete';
    var result = "false";
    Map data = {
      'idDuenio': owner.idDuenio,
    };
    String jsonObject = json.encode(data);
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonObject).then((value){return result = "true";});

    return result;
  }

  @override
  Future<List<ListOwner>> getListOwnerList() async {
    List<ListOwner> listOwners = [];
    Uri url = Uri.parse('${URL}/listDuenios');
    final respuesta = await http.get(url);
    var info = json.decode(respuesta.body);

    for (var item = 0; item < info.length; item++) {
      listOwners.add(ListOwner.fromJson(info[item]));
    }
    return listOwners;
  }

  @override
  Future<List<ListOwner>> postListOwnerList(ListOwner owner) {
    // TODO: implement postListOwnerList
    throw UnimplementedError();
  }

  @override
  Future<List<ListOwner>> updateOwnerList() {
    // TODO: implement updateOwnerList
    throw UnimplementedError();
  }

}
