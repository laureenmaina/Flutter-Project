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
  // void login() async {
  //   //String url = 'http://192.168.0.45:8079/projects/phpdata/apicrudtrial/api/login.php';
void login() async {
  String url = 'http://192.168.0.45:8079/projects/phpdata/apicrudtrial/api/login.php';
  //String url = 'http://192.168.100.12:8079/projects/phpdata/apicrudtrial/api/login.php';

  final Map<String, dynamic> queryParams = {
    'username': _usernameController.text,
    'password': _passwordController.text,
  };

  try {
    http.Response response = await http.get(Uri.parse(url).replace(queryParameters: queryParams));

    // Print the full response body for debugging
    print('Response body: ${response.body}'); 

    if (response.statusCode == 200) {
      var user = jsonDecode(response.body);

      // Print the decoded user data for debugging
      print('Decoded user data: $user');

      // Check if the user data contains the 'usr_fullname' key
      if (user != null && user.isNotEmpty && user.containsKey('usr_fullname') && user['usr_fullname'] != null) {
        setState(() {
          _msg = user['usr_fullname'];  // Display the full name if available
        });
      } else {
        setState(() {
          _msg = "Invalid username or password";  // Display error if no user found
        });
      }
    } else {
      setState(() {
        _msg = "Error: ${response.statusCode}";
      });
      print("Error: ${response.statusCode}");
    }
  } catch (error) {
    setState(() {
      _msg = "$error";
    });
  }
}


  }













































// import 'dart:convert';
// import 'package:http/http.dart' as http;


// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();

//   String _msg = " ";
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Login")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               SizedBox(height: 20),
//               TextFormField(
//                 controller: _usernameController,
//                 decoration: InputDecoration(labelText: 'Username'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your username';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(labelText: 'Password'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   return null;
//                 },
//               ),
//               // SizedBox(height: 20),
//               // TextFormField(
//               //   controller: userIdController,
//               //   obscureText: true,
//               //   decoration: InputDecoration(labelText: 'Password'),
//               //   validator: (value) {
//               //     if (value == null || value.isEmpty) {
//               //       return 'Please enter your password';
//               //     }
//               //     return null;
//               //   },
//               // ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                 //   if (_formKey.currentState?.validate() ?? false) {
//                 //     // Handle login logic
//                 //     print('Username: ${_usernameController.text}');
//                 //     print('Password: ${_passwordController.text}');
//                 //   }
//                 login();
//                 }, child: Text("Login"),
//               ),
//               Text(_msg,
//               style: const TextStyle(
//                 fontSize: 20.0,
//               ),)
//             ],
//           ),
//         ),
//       ),
//     );
//   }

 
//  void login() async {

//    String url = 'http://192.168.0.45:8079/projects/phpdata/apicrudtrial/api/login.php';
// //String url = 'http://192.168.100.12:8079/projects/phpdata/apicrudtrial/api/login.php';
// final Map<String, dynamic> queryParams = {
//     "username": _usernameController.text,
//     "password": _passwordController.text,
// };

// try{
//     http.Response response =
//         await http.get(Uri.parse(url).replace(queryParameters: queryParams));
    
//     if (response.statusCode == 200){
//         var jsonData = jsonDecode(response.body);
        
//         // Check if jsonData contains expected data structure
//         if(jsonData is List && jsonData.isNotEmpty){
//             var firstElement = jsonData.first;
            
//             // Check for 'usr_fullname' key in firstElement
//             if(firstElement is Map<String, dynamic> && firstElement.containsKey('usr_fullname')){
//                 String? usrFullName = firstElement['usr_fullname'];
                
//                 setState(() => 
//                     _msg = usrFullName ?? "User name not found"
//                 );
//             } else { 
//               setState(() => 
//                   _msg = "Unexpected data format"
//               );
//             }
//         }else{
//           setState(() => 
//               _msg = "Invalid username or password"
//           );
//         }

//       }else{
//           print("Error: ${response.statusCode}");
//           setState(() => 
//               _msg ="Server responded with status code ${response.statusCode}"
//           );
//       }
      
// }catch(error){
//       setState(() => 
//           _msg ="$error"
//       );
// }

// }


// }
