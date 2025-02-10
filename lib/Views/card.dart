import 'package:flutter/material.dart';
import 'package:rest_api_flutter/models/post.dart';

class InformationPage extends StatelessWidget {
  final Post info;

  const InformationPage( {
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(info.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: <Widget>[
              Text('UserId: ${info.userId}',  
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('ID: ${info.id}',  
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              Text('Title: ${info.title}', 
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Body: ${info.body}', 
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      );
}