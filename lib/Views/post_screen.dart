//Modified
import 'package:flutter/material.dart';
import 'package:rest_api_flutter/Services/delete_data.dart';
import 'package:rest_api_flutter/Services/remote_service.dart';
import 'package:rest_api_flutter/Views/images_.dart';
import 'package:rest_api_flutter/models/post.dart';
import 'package:rest_api_flutter/Services/add_data.dart';
import 'package:rest_api_flutter/Services/update_data.dart';
import 'package:flutter/cupertino.dart';


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

  List<Post>? infomation;
  var isLoaded = false;
  String url = '';
  


  @override
  void initState() {
    super.initState();
    getData();
    userIdController = TextEditingController(text:widget.info?.userId ?? "" );
    idController =    TextEditingController(text: widget.info?.id ?? "");
    titleController = TextEditingController(text: widget.info?.title ?? "" );
    bodyController = TextEditingController(text: widget.info?.body ?? "");
    imageController = TextEditingController(text: widget.info?.image ?? "");
    activeController = TextEditingController(text: widget.info?.active ?? "");
    // datedController = new TextEditingController(text: widget.info?.dated ?? "");
    datedController = TextEditingController(text: _dateTime.toString());

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
          image: imageController.text,
          active: activeController.text,
          dated: datedController.text,
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
    print("Image: ${imageController.text}");
    print("Active: ${activeController.text}");
    print("Dated: ${datedController.text}");


    Post modifiedPost = Post(
      userId:userIdController.text,
      id: idController.text,
      title: titleController.text,
      body: bodyController.text,
      image: imageController.text,
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
              // TextFormField(
              //   controller: imageController,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: "Enter Image",
              //   ),
              //   validator: (value) =>
              //       value == null || value.isEmpty ? "Enter Image" : null,
              // ),             
              
              const SizedBox(height: 15),
              TextFormField(
                controller: activeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Active",
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Enter Active" : null,
              ),
       
               Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                 ElevatedButton(
                  onPressed: activepost,
                  child: const Text("Active"),
                ),
                ElevatedButton(
                  onPressed: notactivepost,
                  child: const Text("Not Active"),
                ),
              ],
            ),
              const SizedBox(height: 20),
                TextFormField(
                controller: datedController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Date",
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Enter Date" : null,
              ),
              Text(_dateTime.toString(), style: TextStyle(fontSize:10),),
              const SizedBox(height: 10),
              MaterialButton(
                onPressed:_showDatePicker,
                color: Colors.blue,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Choose Date",
                   style: TextStyle(
                    color: Colors.white,
                    fontSize:15,
                     ),
                     ),
                ),
               
              ),
            const SizedBox(height: 10),
              MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const FetchImage(),
                  ));
                },
                child: Text("Fetch Images"),
              ),

            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     minimumSize: Size.fromHeight(20),
            //     primary: Colors.white,
            //     onPrimary:Colors.black,
            //     textStyle: TextStyle(fontSize: 20),
            //   ),
            //   child: Row(
            //     children: [
            //       Icon()
            //     ],
            //   )),

            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 15), 
                ElevatedButton(
                  onPressed: updatePost,
                  child: const Text("Update Entry"),
                ),
                const SizedBox(width: 15),
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
}


































