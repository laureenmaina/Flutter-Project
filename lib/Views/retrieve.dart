import 'package:flutter/material.dart';
import 'package:rest_api_flutter/models/post.dart';

class RetrievePage extends StatelessWidget {
  final Post info;

  const RetrievePage({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          // title: Text(info.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'UserId: ${info.userId}',
                  hintText:'Enter UserId',
                ),
              ),
              SizedBox(height: 20), 
              TextField(
                obscureText:true, 
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:'id : ${info.id} ', 
                  hintText:'Enter Id', 
                ),
              ),
               TextField(
                obscureText:true, 
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:'title : ${info.title}', 
                ),),

               TextField(
                obscureText:true, 
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:'body : ${info.body}', 
                ),),
            ],
          ),
        ),
      );
}
