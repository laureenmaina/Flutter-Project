import 'package:flutter/cupertino.dart';
import 'package:rest_api_flutter/Views/home_page.dart';
import 'package:rest_api_flutter/Views/post_screen.dart';


class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});


@override
Widget build(BuildContext context) {
  return CupertinoPageScaffold(
    navigationBar: const CupertinoNavigationBar(
      middle: Text('Welcome to My App'),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [

          CupertinoButton(
            child: const Text('Show Available Entries'), 
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          CupertinoButton(
            child: const Text('Create a New Entry'), 
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => const PostFormScreen()),
              );
            },
          ),
          // CupertinoButton(
          //   child: const Text('Active Button'), 
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       CupertinoPageRoute(builder: (context) => const ActiveButton()),
          //     );
          //   },
          // ),
          //   CupertinoButton(
          //   child: const Text('Delete an Entry'), 
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       CupertinoPageRoute(builder: (context) => const DeleteFormScreen()),
          //     );
          //   },
          // ),
        ],
      ),
    ),
  );
}}



































//Original

// import 'package:flutter/cupertino.dart';
// import 'package:rest_api_flutter/Views/delete_screen.dart';
// import 'package:rest_api_flutter/Views/home_page.dart';
// import 'package:rest_api_flutter/Views/post_screen.dart';
// import 'package:rest_api_flutter/Views/update_screen.dart';

// void main() {
//   runApp(const CupertinoApp(
//     title: 'Navigation Basics',
//     home: HomePage(),
//   ));
// }

// class FirstRoute extends StatelessWidget {
//   const FirstRoute({super.key});


// @override
// Widget build(BuildContext context) {
//   return CupertinoPageScaffold(
//     navigationBar: const CupertinoNavigationBar(
//       middle: Text('Welcome to My App'),
//     ),
//     child: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center, 
//         children: [

//           CupertinoButton(
//             child: const Text('Show Available Entries'), 
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 CupertinoPageRoute(builder: (context) => const HomePage()),
//               );
//             },
//           ),
//           CupertinoButton(
//             child: const Text('Create a New Entry'), 
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 CupertinoPageRoute(builder: (context) => const PostFormScreen()),
//               );
//             },
//           ),
//           CupertinoButton(
//             child: const Text('Update an Entry'), 
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 CupertinoPageRoute(builder: (context) => const UpdateFormScreen()),
//               );
//             },
//           ),
//             CupertinoButton(
//             child: const Text('Delete an Entry'), 
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 CupertinoPageRoute(builder: (context) => const DeleteFormScreen()),
//               );
//             },
//           ),
//         ],
//       ),
//     ),
//   );
// }}


