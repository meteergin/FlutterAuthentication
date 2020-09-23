import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const SERVER_IP = 'http://localhost:8080';

class AuthenticationService {
  Future<String> attemptLogIn(String username, String password) async {
    var response = await http.post(
        Uri.encodeFull("$SERVER_IP/api/authenticate"),
        body: json.encode({"username": username, "password": password}),
        headers: {"content-type": "application/json"});
    if (response.statusCode == 200) return response.body;
    return null;
  }
}
