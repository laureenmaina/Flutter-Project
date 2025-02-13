// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
    String userId;
    String id;
    String title;
    String body;
    String images;
    String active;
    String dated;
    String username;
    String password;

    Post({
       required this.userId,
       required this.id,
       required this.title,
       required this.body,
       required this.images,
       required this.active,
       required this.dated,
       required this.username,
       required this.password
    });

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
        images: json["images"],
        active: json["active"],
        dated: json["dated"],
        username: json["username"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
        "images": images,
        "active": active,
        "dated": dated,
        "username": username,
        "password": password,
    };
}
