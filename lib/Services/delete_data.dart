import 'package:http/http.dart' as http;
import 'dart:convert';

class DeleteService {
  Future<bool> deleteData(String id) async {
    var client = http.Client();
    
    var uri = Uri.parse('http://192.168.0.45:8079/projects/phpdata/apicrudtrial/api/delete.php');
    // var uri = Uri.parse('http://192.168.100.12:8079/projects/phpdata/apicrudtrial/api/delete.php');

    try {
      var response = await client.post(
        uri,
        headers: {"Content-Type": "application/json"},
        body: json.encode({"id": id}),
      );

      print("Response Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      return response.statusCode == 200;
    } catch (e) {
      print("Error: $e");
      return false;
    } finally {
      client.close();
    }
  }
}
