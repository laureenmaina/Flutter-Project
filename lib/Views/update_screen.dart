import 'package:flutter/material.dart';
import 'package:rest_api_flutter/Services/update_data.dart';
import 'package:rest_api_flutter/Views/image_picker.dart';
import 'package:rest_api_flutter/Views/radio_picker.dart';
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
  TextEditingController _passwordController = TextEditingController();
    TextEditingController _usernameController= TextEditingController();

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
    print("Username: ${_usernameController.text}");
    print("Password: ${_passwordController.text}");

    Post modifiedPost = Post(
      userId: userIdController.text,
      id: idController.text,
      title: titleController.text,
      body: bodyController.text,
      images: imageController.text,
      active: activeController.text,
      dated: datedController.text,
      username: _usernameController.text,
      password: _passwordController.text,
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
          _usernameController.clear();
          _passwordController.clear();
          
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
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter UserId",
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Enter UserId" : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: idController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Post ID",
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Enter Post ID" : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Title",
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Enter Title" : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: bodyController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Body",
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Enter Body" : null,
              ), 
                   const SizedBox(height: 15),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Username",
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Enter Username" : null,
              ), 
                   const SizedBox(height: 15),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Password",
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Enter Password" : null,
              ), 
                             
              const SizedBox(height: 15),
              RadioPicker(),


            const SizedBox(height: 15),
            TextField(
            controller: datedController,
            decoration: const InputDecoration(
              labelText: 'DATE',
              filled: true,
              prefixIcon: Icon(Icons.calendar_today),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue)
              ),
            ),
            readOnly: true,
            onTap: () {
              _selectDate();
            },
          ),
      
              const SizedBox(height: 15),
             MyImagePicker(),
              const SizedBox(height: 15),

                             
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
   Future<void>_selectDate() async{
   DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), 
      lastDate: DateTime(2100)
      );

    if (_picked != null){
      setState(() {
        datedController.text = _picked.toString().split(" ")[0];
      });
    }
  }
}
