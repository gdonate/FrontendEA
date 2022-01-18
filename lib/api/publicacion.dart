class Publicacion{
  final String id;
  final String nombre;
  final String descripcion;
  final String ubicacion;

  //Publicacion(this.id, this.username, this.password, this.email, this.name, this.edad, this.descripcion, this.imageUrl, this.puntuacion);

  Publicacion({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.ubicacion,
  } 
  );

  factory Publicacion.fromJson(Map<String, dynamic> json) {
    return Publicacion(
      id: json['id'],
      nombre: json['nombre'],      
      descripcion: json['descripcion'],
      ubicacion: json['ubicacion'],
    );
  }
}