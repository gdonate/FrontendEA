import 'dart:async';
import 'dart:convert';
import 'package:registro/api/user.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/transformers.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class RegistroBloc {
  final _email = BehaviorSubject<String>();
  final _username = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _confirmPassword = BehaviorSubject<String>();
  final _user = BehaviorSubject<User>();

  //Get
  Stream<String> get email => _email.stream.transform(validateEmail);

  Stream<String> get username => _username.stream.transform(validateUsername);

  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<String> get confirmPassword => _confirmPassword.stream
          .transform(validateConfirmPassword)
          .doOnData((String c) {
        c = _password.value;
        if (0 != _confirmPassword.value.compareTo(c)) {
          _confirmPassword.addError("Las contraseñas no coinciden");
        }
      });

  Stream<bool> get userValid => Rx.combineLatest4(email, username, password,
      confirmPassword, (email, username, password, confirmPassword) => true);

  Stream<User> get user => _user.stream;

  //Set
  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changeUsername => _username.sink.add;

  Function(String) get changePassword => _password.sink.add;

  Function(String) get changeConfirmPassword => _confirmPassword.sink.add;

  Function(User) get changeUser => _user.sink.add;

  dispose() {
    _email.close();
    _username.close();
    _password.close();
    _confirmPassword.close();
    _user.close();
  }

  //Transformers
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (!email.contains('@')) {
      sink.addError('Introduce un correo electronico valido');
    } else {
      sink.add(email);
    }
  });
  final validateUsername = StreamTransformer<String, String>.fromHandlers(
      handleData: (username, sink) {
    if (username.isEmpty) {
      sink.addError('Introduce un nombre de usuario');
    } else {
      sink.add(username);
    }
  });
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.isEmpty) {
      sink.addError('Introduce una contraseña');
    } else {
      sink.add(password);
    }
  });
  final validateConfirmPassword =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (confirmPassword, sink) {
    if (confirmPassword.isEmpty) {
      sink.addError('Introduce una contraseña');
    } else {
      sink.add(confirmPassword);
    }
  });



  Future<User> createUser() async {
    final response = await http.post(
      Uri.parse('http://localhost:8080/api/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "username": _username.value,
        "email": _email.value,
        "password": _password.value
      }),
    );
    if(response.statusCode == 201){
      return User.fromJson(jsonDecode(response.body));
    }
    else if(response.statusCode == 405){
      throw Exception("El usuario ya existe");
    }
    else{
      throw Exception("Error creando al usuario");
    }
  }
}
