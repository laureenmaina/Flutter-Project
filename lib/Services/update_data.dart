import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rest_api_flutter/models/post.dart';

class UpdateService {
Future<bool> updateData(Post post) async {
  var client = http.Client();

   var uri = Uri.parse('http://192.168.0.45:8079/projects/phpdata/apicrudtrial/api/update.php');
 // var uri = Uri.parse('http://192.168.100.12:8079/projects/phpdata/apicrudtrial/api/update.php');


  var response = await client.post(
    uri,
    headers: {"Content-Type": "application/json"},
    body: json.encode({
      "userId": post.userId,
      "id": post.id,
      "title": post.title,
      "body": post.body,
      "image": post.image,
      "active": post.active,
      "dated": post.dated,
    }),
  );

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}


}
