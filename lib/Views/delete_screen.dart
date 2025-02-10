import 'package:flutter/material.dart';
import 'package:rest_api_flutter/Services/delete_data.dart';

class DeleteFormScreen extends StatefulWidget {
  const DeleteFormScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DeleteFormScreenState createState() => _DeleteFormScreenState();
}

class _DeleteFormScreenState extends State<DeleteFormScreen> {
  final TextEditingController idController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> deletePost() async {
    if (_formKey.currentState!.validate()) {
      String postId = idController.text.trim();

      print("Attempting to delete post with ID: $postId");

      bool success = await DeleteService().deleteData(postId);

      if (success) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Post deleted successfully!")),
        );
        idController.clear();
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to delete post.")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Delete Post")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: idController,
                decoration: const InputDecoration(labelText: "Post ID"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a Post ID";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: deletePost,
                child: const Text("Delete Post"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
