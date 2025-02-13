import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _msg = "";
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                //   if (_formKey.currentState?.validate() ?? false) {
                //     // Handle login logic
                //     print('Username: ${_usernameController.text}');
                //     print('Password: ${_passwordController.text}');
                //   }
                login();
                }, child: Text("Login"),
              ),
              Text(_msg,
              style: const TextStyle(
                fontSize: 20.0,
              ),)
            ],
          ),
        ),
      ),
    );
  }
  void login() async {
    String url = 'http://192.168.0.45:8079/projects/phpdata/apicrudtrial/api/login.php';

    final Map<String, dynamic> queryParams = {
        "username": _usernameController.text,
        "password": _passwordController.text,

    };
    try{
      http.Response  response =
        await http.get(Uri.parse(url).replace(queryParameters: queryParams));
        if (response.statusCode == 200){
            var user =jsonDecode(response.body);
            if(user.isNotEmpty){     
              setState(() {
                _msg =user[0]['usr_username'];
                
              });
            }else{
              setState(() {
                _msg = "Invalid username or password";
              });
            }

            print(response.body);
        }
        else{
          print("Error: ${response.statusCode}");
        }
    }
    catch(error){
      setState(() {
      _msg = "$error";
        
      });
    }
  }
}


