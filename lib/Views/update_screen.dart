import 'package:flutter/material.dart';
import 'package:rest_api_flutter/Services/update_data.dart';
import 'package:rest_api_flutter/models/post.dart';


class UpdateFormScreen extends StatefulWidget {
  const UpdateFormScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UpdateFormScreenState createState() => _UpdateFormScreenState();
}

class _UpdateFormScreenState extends State<UpdateFormScreen> {
  late TextEditingController userIdController = TextEditingController();
  late TextEditingController idController = TextEditingController();
  late TextEditingController titleController = TextEditingController();
  late TextEditingController bodyController = TextEditingController();
  late TextEditingController imageController = TextEditingController();
  late TextEditingController activeController = TextEditingController();
  late TextEditingController datedController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> updatePost() async {
  if (_formKey.currentState!.validate()) {
    print("UserID: ${userIdController.text}");
    print("PostID: ${idController.text}");
    print("Title: ${titleController.text}");
    print("Body: ${bodyController.text}");
    print("Images: ${imageController.text}");
    print("Active: ${activeController.text}");
    print("Dated: ${datedController.text}");

    Post modifiedPost = Post(
      userId: userIdController.text,
      id: idController.text,
      title: titleController.text,
      body: bodyController.text,
      images: imageController.text,
      active: activeController.text,
      dated: datedController.text,
    );

    bool success = await UpdateService().updateData(modifiedPost);

    if (success) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Post updated successfully!")),
      );
          userIdController.clear();
          idController.clear();
          titleController.clear();
          bodyController.clear();
          imageController.clear();
          activeController.clear();
          datedController.clear();
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to update post.")),
      );
    }
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Post")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(   
                controller: userIdController,
                decoration: InputDecoration(labelText: "User ID"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a User ID";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: idController,
                decoration: InputDecoration(labelText: "Post ID"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a Post ID";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: "Title"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a Title";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: bodyController,
                decoration: InputDecoration(labelText: "Body"),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the Body text";
                  }
                  return null;
                },
                
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: imageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Image Url",
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Enter Image Url" : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: activeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Active",
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Enter Active" : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: datedController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Dated",
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Enter Dated" : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: updatePost,
                child: Text("Update Post"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
