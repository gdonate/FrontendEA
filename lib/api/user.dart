class User{
  final String id;
  final String username;
  final String password;
  final String email;
  final String nombre;
  final int fecha;
  final String edad;
  final String descripcion;
  final String imageUrl;
  final int puntuacion;
  final int time;

  //User(this.id, this.username, this.password, this.email, this.name, this.edad, this.descripcion, this.imageUrl, this.puntuacion);

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.nombre,
    required this.fecha,
    required this.edad,
    required this.descripcion,
    required this.imageUrl,
    required this.puntuacion,
    required this.time, 
  } 
  );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],      
      password: json['password'],
      email: json['email'],
      nombre: json['nombre'],
      fecha: json['fecha'],
      edad: json['edad'],
      descripcion: json['descripcion'],
      imageUrl: json['imageUrl'],
      puntuacion: json['puntuacion'],
      time: json['time'],
    );
  }
}