import 'package:flutter/material.dart';
import 'package:rest_api_flutter/Services/remote_service.dart';
import 'package:rest_api_flutter/Views/post_screen.dart';
import 'package:rest_api_flutter/models/post.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState(){
    super.initState();

//fetch data from Api
    getData();
    
  }

  getData() async{
   posts = await RemoteService().getPosts();

   if (posts != null){
    setState(() {
      isLoaded = true;
      
    });
    
   }
  } 
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Data'),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder:(context, index) => Card(
            child: ListTile(
              title: Text(
                        posts![index].title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold ),
                          ),

              trailing: const Icon(Icons.arrow_forward),

          onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PostFormScreen(info: posts![index]), 
          ));
        },


            )
            )
            )
            )
            );
            }
            }
          // ) {
          //   return Container(
          //     padding: const EdgeInsets.all(16),
          //     child:Row(
          //       children:[
          //         Container(
          //           height: 50,
          //           width: 50,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(12),
          //             color: Colors.grey[300],

          //           ),
          //         ),
          //         SizedBox(width: 16),
          //       Expanded(
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text(
          //               posts![index].title,
          //               maxLines: 2,
          //               overflow: TextOverflow.ellipsis,
          //               style: TextStyle(
          //                 fontSize: 24,
          //                 fontWeight: FontWeight.bold ),
          //                 ),

                  
                        // Text(
                        // posts![index].body,
                        // maxLines: 3,
                        // overflow: TextOverflow.ellipsis,
                        // style: TextStyle(
                        //   fontSize: 24,
                        //   fontWeight: FontWeight.bold ),
                        //   ),
//                     ],
//                   ),

//                 ),   
//                 ],
//               ),
//             );
//           },
//            ),
//       ),
//     );
//   }
// }