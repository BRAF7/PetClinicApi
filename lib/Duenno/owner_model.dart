class ListOwner {
  int? idDuenio;
  String? nombre;
  String? telefono;
  String? direccion;
  String? email;

  ListOwner(Type listOwnerRepository, 
      {this.idDuenio, this.nombre, this.telefono, this.direccion, this.email});

  ListOwner.fromJson(Map<String, dynamic> json) {
    idDuenio = json['idDuenio'];
    nombre = json['nombre'];
    telefono = json['telefono'];
    direccion = json['direccion'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idDuenio'] = this.idDuenio;
    data['nombre'] = this.nombre;
    data['telefono'] = this.telefono;
    data['direccion'] = this.direccion;
    data['email'] = this.email;
    return data;
  }
}