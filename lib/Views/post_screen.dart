//Modified
import 'package:flutter/material.dart';
import 'package:rest_api_flutter/Services/delete_data.dart';
import 'package:rest_api_flutter/Services/remote_service.dart';
import 'package:rest_api_flutter/Views/image_picker.dart';
import 'package:rest_api_flutter/Views/radio_picker.dart';
import 'package:rest_api_flutter/models/post.dart';
import 'package:rest_api_flutter/Services/add_data.dart';
import 'package:rest_api_flutter/Services/update_data.dart';




class PostFormScreen extends StatefulWidget {
  const PostFormScreen({super.key, this.info});
  final Post? info;

  @override
  _PostFormScreenState createState() => _PostFormScreenState();
}

class _PostFormScreenState extends State<PostFormScreen> {

  late TextEditingController userIdController = TextEditingController();
  late TextEditingController idController = TextEditingController();
  late TextEditingController titleController = TextEditingController();
  late TextEditingController bodyController = TextEditingController();
  late TextEditingController imageController = TextEditingController();
  late TextEditingController activeController = TextEditingController();
  late TextEditingController datedController = TextEditingController();
   TextEditingController _passwordController = TextEditingController();
    TextEditingController _usernameController= TextEditingController();

  List<Post>? infomation;
  var isLoaded = false;
  // String url = '';
  


  @override
  void initState() {
    super.initState();
    getData();
    userIdController = TextEditingController(text:widget.info?.userId ?? "" );
    idController =    TextEditingController(text: widget.info?.id ?? "");
    titleController = TextEditingController(text: widget.info?.title ?? "" );
    bodyController = TextEditingController(text: widget.info?.body ?? "");
    imageController = TextEditingController(text: widget.info?.images ?? "");
    activeController = TextEditingController(text: widget.info?.active ?? "");
    // datedController = new TextEditingController(text: widget.info?.dated ?? "");
    datedController = TextEditingController(text: _dateTime.toString());
    _usernameController = TextEditingController(text: widget.info?.username ?? "");
    _passwordController = TextEditingController(text: widget.info?.password ?? "");

  }

  getData() async {
    infomation = await RemoteService().getPosts();
    if (infomation != null && mounted) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  
//Add a Post
  Future<void> submitPost() async {
    if (_formKey.currentState!.validate()) {
      try {      
         Post newPost = Post(
          userId:userIdController.text,
          id: idController.text,
          title: titleController.text,
          body: bodyController.text,
          images: imageController.text,
          active: activeController.text,
          dated: datedController.text,
          username: _usernameController.text,
          password: _passwordController.text,
        );

        bool success = await AddService().postData(newPost);

        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Post created successfully!")),
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
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Failed to create post.")),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: $e")),
        );
      }
    }
  }

// Update Post
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
      userId:userIdController.text,
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

//Delete Post
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

  //Date Picker

  DateTime _dateTime = DateTime.now();

void _showDatePicker() {
  showDatePicker(
    context: context,
    initialDate: DateTime(2025, 2, 7), 
    firstDate: DateTime(2000),
    lastDate: DateTime(2025, 12, 31), 
  ).then((value){
    setState(() {
      _dateTime = value!;
      
    });

});
}

bool isActive = false; 

void activepost() {
  setState(() {
    isActive = true;
    activeController.text = '0'; 
  });
}

void notactivepost() {
  setState(() {
    isActive = false;
    activeController.text = '1'; 
     });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Post Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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

        
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
               const SizedBox(height: 10), 
                ElevatedButton(
                  onPressed: submitPost,
                  child: const Text("Create Entry"),
                ),
                const SizedBox(height: 10), 
                ElevatedButton(
                  onPressed: updatePost,
                  child: const Text("Update Entry"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: deletePost,
                  child: const Text("Delete Entry"),
                ),
              ],
            )
            ] 
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


































