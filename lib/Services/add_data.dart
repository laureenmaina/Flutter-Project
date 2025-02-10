// Original

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rest_api_flutter/models/post.dart';

class AddService {
Future<bool> postData(Post post) async {
  var client = http.Client();

   var uri = Uri.parse('http://192.168.0.45:8079/projects/phpdata/apicrudtrial/api/create.php');
 // var uri = Uri.parse('http://192.168.100.12:8079/projects/phpdata/apicrudtrial/api/create.php');


  var response = await client.post(
    uri,
    headers: {"Content-Type": "application/json"},
    body: json.encode({
      "userId": 0,
      "id": post.id,
      "title": post.title,
      "body": post.body,
    }),
  );

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}


}
