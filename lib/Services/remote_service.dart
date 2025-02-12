import 'package:rest_api_flutter/models/post.dart';
import 'package:http/http.dart' as http;

class RemoteService {

  Future<List<Post>?> getPosts() async{
    var client = http.Client();

   var uri = Uri.parse('http://192.168.0.45:8079/projects/phpdata/apicrudtrial/api/read.php');
   //var uri = Uri.parse('http://192.168.100.12:8079/projects/phpdata/apicrudtrial/api/read.php');
    
    var response = await client.get(uri);

    if (response.statusCode == 200){

      var json = response.body;
      return postFromJson(json);

    }
    return null; 
  }


}