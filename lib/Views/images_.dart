// import 'package:flutter/material.dart';

// class FetchImage extends StatefulWidget {
//   const FetchImage({super.key});

//   @override
//   State<FetchImage> createState() => _FetchImageState();
// }

// class _FetchImageState extends State<FetchImage> {
//   final List<String> imagePaths = [
//     'assets/day.png' ,
//     'assets/tech.png',
//     'assets/meditation.png',
//     'assets/mountain.png',
//     'assets/hey.png',
//     'assets/cooking.png',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.blueGrey,
//         body: Padding(
//           padding: const EdgeInsets.all(6.0),
//           child: GridView.builder(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2, 
//               crossAxisSpacing: 6,
//               mainAxisSpacing: 6,
//             ),
//             itemCount: imagePaths.length,
//             itemBuilder: (context, index) {
//               return Image.asset(
//                 imagePaths[index],
//                 fit: BoxFit.cover, 
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }























































