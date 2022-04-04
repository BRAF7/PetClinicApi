class MascotaModel {
  int? idMascota;
  String? nombre;
  String? tipo;
  String? idDuenio;
  String? idCita;
  String? idMedicamento;
  String? fechaIngreso;
  String? razon;

  MascotaModel(
      {this.idMascota,
      this.nombre,
      this.tipo,
      this.idDuenio,
      this.idCita,
      this.idMedicamento,
      this.fechaIngreso,
      this.razon});

  MascotaModel.fromJson(Map<String, dynamic> json) {
    idMascota = json['idMascota'];
    nombre = json['nombre'];
    tipo = json['tipo'];
    idDuenio = json['idDuenio'].toString();
    idCita = json['idCita'].toString();
    idMedicamento = json['idMedicamento'].toString();
    fechaIngreso = json['fechaIngreso'];
    razon = json['razon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idMascota'] = this.idMascota;
    data['nombre'] = this.nombre;
    data['tipo'] = this.tipo;
    data['idDuenio'] = this.idDuenio;
    data['idCita'] = this.idCita;
    data['idMedicamento'] = this.idMedicamento;
    data['fechaIngreso'] = this.fechaIngreso;
    data['razon'] = this.razon;
    return data;
  }
}
