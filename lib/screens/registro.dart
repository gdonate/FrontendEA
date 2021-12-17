import 'package:registro/blocs/registro_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registro/generated/l10n.dart';

class Registro extends StatelessWidget {
  String _error = "";

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RegistroBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 300.0,
            child: Column(
              children: <Widget>[
                email(bloc),
                username(bloc),
                password(bloc),
                confirmPassword(bloc),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: botonValidar(bloc),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget email(RegistroBloc bloc) {
    return StreamBuilder<Object>(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            decoration: InputDecoration(
                icon: Icon(Icons.mail_outline),
                labelText: S.current.email,
                errorText: snapshot.error?.toString()),
          );
        });
  }

  Widget password(RegistroBloc bloc) {
    return StreamBuilder<Object>(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            obscureText: true,
            onChanged: bloc.changePassword,
            decoration: InputDecoration(
                icon: Icon(Icons.vpn_key_sharp),
                labelText: S.current.password,
                errorText: snapshot.error?.toString()),
          );
        });
  }

  Widget confirmPassword(RegistroBloc bloc) {
    return StreamBuilder<Object>(
        stream: bloc.confirmPassword,
        builder: (context, snapshot) {
          return TextField(
            obscureText: true,
            onChanged: (value) => bloc.changeConfirmPassword(value),
            decoration: InputDecoration(
                icon: Icon(Icons.vpn_key_sharp),
                labelText: S.current.password,
                errorText: snapshot.error?.toString()),
          );
        });
  }

  Widget username(RegistroBloc bloc) {
    return StreamBuilder<Object>(
        stream: bloc.username,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeUsername,
            decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: S.current.user,
                errorText: snapshot.error?.toString()),
          );
        });
  }

  Widget botonValidar(RegistroBloc bloc) {
    return StreamBuilder<Object>(
        stream: bloc.userValid,
        builder: (context, snapshot) {
          return StreamBuilder<Object>(
              stream: bloc.user,
              builder: (context, snapshot2) {
                return Column(
                  children: [
                    Text(_error),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      child: const Text('Registrarse'),
                      onPressed: !snapshot.hasData
                          ? null
                          : () => {
                        bloc.createUser(),
                        if (snapshot2.error.toString().isNotEmpty)
                          {
                            _error = snapshot2.error.toString(),
                          }
                      },
                    )
                  ],
                );
              });
        });
  }
}