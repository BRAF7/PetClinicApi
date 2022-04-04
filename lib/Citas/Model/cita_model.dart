class CitaModel {
  int? idCita;
  String? fecha;
  String? hora;
  String? tipoServicio;

  CitaModel(this.idCita, this.fecha, this.hora, this.tipoServicio);

  CitaModel.fromJson(Map<String, dynamic> json) {
    idCita = json['idCita'];
    fecha = json['fecha'];
    hora = json['hora'];
    tipoServicio = json['tipoServicio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCita'] = this.idCita;
    data['fecha'] = this.fecha;
    data['hora'] = this.hora;
    data['tipoServicio'] = this.tipoServicio;
    return data;
  }
}
