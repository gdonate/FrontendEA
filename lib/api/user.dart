class User {
  final String? username;
  final String? email;
  final String? password;
  final String? title;
  final String? body;


  User({required this.username, required this.email, required this.password, required this.title, required this.body});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      password: json['password'],
      title: json['title'],
      body: json['body'],
    );
  }
}
