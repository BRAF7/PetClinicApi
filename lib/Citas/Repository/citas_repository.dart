import '../Model/cita_model.dart';

abstract class CitasRepository{
  Future<List<CitaModel>> getCitaList();
  Future<String> editCita(CitaModel model);
  Future<List<CitaModel>> postCitaList(CitaModel model);
  Future<List<CitaModel>> addCita(CitaModel model);
  Future<String> deleteCitaList(CitaModel model); 
}