import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:registro/constants.dart';
import 'package:registro/models/form_validation.dart';
import 'package:registro/models/user_model.dart';
import 'package:registro/screens/home_page.dart';
import 'package:registro/util/navegate.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager with Validation {
  User? userModel;
  bool isGoogleSession = false;

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);
  GoogleSignInAccount? user;

  final BehaviorSubject<String> _email =
      BehaviorSubject.seeded('axel1@test.com');
  final BehaviorSubject<String> _password = BehaviorSubject.seeded('123');
  final BehaviorSubject<Cookie> _accessToken = BehaviorSubject<Cookie>();
  final BehaviorSubject<Cookie> _refreshToken = BehaviorSubject<Cookie>();
  final BehaviorSubject<User?> _userModel = BehaviorSubject<User?>();
  final BehaviorSubject<GoogleSignInAccount> _googleUser =
      BehaviorSubject<GoogleSignInAccount>();

  Stream get email$ => _email.stream.transform(emailValidation);
  Stream get password$ => _password.stream.transform(passwordValidation);
  Stream<User?> get userModel$ => _userModel.stream;

  void addEmail(String email) => _email.sink.add(email);
  void addPassword(String password) => _password.sink.add(password);
  void addAccessToken(Cookie accessToken) => _accessToken.sink.add(accessToken);
  void addrefreshToken(Cookie refreshToken) =>
      _refreshToken.sink.add(refreshToken);
  void addGoogleUser(GoogleSignInAccount user) => _googleUser.sink.add(user);
  void addUserModel(User? user) => _userModel.sink.add(user);

  String get inEmail => _email.value;
  String get inPassword => _password.value;
  Cookie get inAcessToken => _accessToken.value;
  Cookie get inRefreshToken => _refreshToken.value;
  GoogleSignInAccount get inGoogleUser => _googleUser.value;
  User? get inUserModel => _userModel.value;

  void getCookiesFromResponse(String cookieHeader) {
    List<String> cookies = cookieHeader.toString().split('HttpOnly,').toList();
    Cookie accessToken = Cookie.fromSetCookieValue(cookieHeader);
    Cookie refreshToken = Cookie.fromSetCookieValue(cookies[1]);
    addAccessToken(accessToken);
    addrefreshToken(refreshToken);
  }

  Future<void> persistCookies(Cookie accessToken, Cookie refreshToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', accessToken.value);
    await prefs.setString('refreshToken', refreshToken.value);
  }

  Future<void> logUserIn(BuildContext context) async {
    isGoogleSession = false;
    var url = Uri.parse(
        kIsWeb ? Constants.LOGIN_URL_WEB : Constants.LOGIN_URL_MOBILE);
    var response = await http.post(url,
        body: {'email': inEmail, 'password': inPassword},
        headers: Constants.reqHeaders);

    if (kIsWeb) return;
    //Get cookies
    analyzeResponse(response, context);
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    await _googleSignIn.signIn();
    isGoogleSession = true;
    if (_googleSignIn.currentUser != null) {
      addGoogleUser(_googleSignIn.currentUser!);
      await signInWithAuthServer(context);
    }
  }

  Future<void> signOutWithGoogle(BuildContext context) async {
    await _googleSignIn.signOut();
    await signOutWithAuthServer(context);
  }

  //TODO create method to contact the backend and set the db to the current user
  Future<void> signInWithAuthServer(BuildContext context) async {
    var url = Uri.parse((kIsWeb)
        ? Constants.BASE_URL_WEB + 'api/user/google'
        : Constants.BASE_URL_MOBILE + 'api/user/google');

    // const {email,name, googleId} = req.body;
    var response = await http.post(url, headers: Constants.reqHeaders, body: {
      'email': _googleSignIn.currentUser!.email.toString(),
      'name': _googleSignIn.currentUser!.displayName.toString(),
      'googleId': _googleSignIn.currentUser!.id.toString(),
      'imageUrl': _googleSignIn.currentUser!.photoUrl.toString(),
    });

    if (kIsWeb) return;
    //Get cookies
    analyzeResponse(response, context);
  }

  Future<void> analyzeResponse(
      http.Response response, BuildContext context) async {
    SnackBar snackBar;

    if (response != null && response.statusCode == 200) {
      getCookiesFromResponse(response.headers['set-cookie'].toString());
      await persistCookies(inAcessToken, inRefreshToken);
      userModel = User.fromJson(jsonDecode(response.body));
      addUserModel(userModel!);
      snackBar = SnackBar(content: Text('Success'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navegate.goToHome(context);
      return;
    }
    snackBar = SnackBar(content: Text('Something went wrong'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> analyzeLogOutResponse(
      http.Response response, BuildContext context) async {
    SnackBar snackBar;

    if (response != null && response.statusCode == 200) {
      getCookiesFromResponse(response.headers['set-cookie'].toString());
      await persistCookies(inAcessToken, inRefreshToken);
      userModel = User(
          id: '', username: '', password: '', email: '', imageUrl: '', time: 0);
      addUserModel(userModel!);
      snackBar = SnackBar(content: Text('Success'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    snackBar = SnackBar(content: Text('Something went wrong'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> signOutWithAuthServer(BuildContext context) async {
    var url = Uri.parse((kIsWeb)
        ? Constants.BASE_URL_WEB + 'api/user/logout'
        : Constants.BASE_URL_MOBILE + 'api/user/logout');

    Map<String, String> cookies = (kIsWeb)
        ? Map<String, String>()
        : {
            'Cookie': 'accessToken=' +
                inAcessToken.value.toString() +
                '; ' +
                'refreshToken=' +
                inRefreshToken.value.toString()
          };

    var response = await http.delete(url,
        headers: (kIsWeb)
            ? Constants.reqHeaders
            : {...Constants.reqHeaders, ...cookies});

    if (kIsWeb) return;
    //Get cookies
    print(response.body.toString());
    analyzeLogOutResponse(response, context);
    cleanUserData();
    Navegate.goToWelcome(context);
    //getCookiesFromResponse(response.headers['set-cookie'].toString());
    //await persistCookies(inAcessToken, inRefreshToken);
  }

  void cleanUserData() {
    userModel = null;
    addUserModel(userModel);
  }
}
