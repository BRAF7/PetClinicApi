import 'cita_model.dart';

abstract class CitasRepository{
  Future<List<CitaModel>> getCitaList();
  Future<List<CitaModel>> updateCitaList();
  Future<List<CitaModel>> postCitaList(CitaModel owner);
  Future<List<CitaModel>> addCita(CitaModel owner);
  Future<String> deleteCitaList(CitaModel owner); 
}