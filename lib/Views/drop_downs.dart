// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;



// class DropDownPage extends StatefulWidget {
//   const DropDownPage({super.key});

//   @override
//   _DropDownPageState createState() => _DropDownPageState();
// }

// class _DropDownPageState extends State<DropDownPage> {
//   @override
//   void initState() {
//     _getCountiesList();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dynamic DropDownList REST API'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           Container(
//             alignment: Alignment.topCenter,
//             margin: EdgeInsets.only(bottom: 100, top: 100),
//             child: Text(
//               'Select a County and City',
//               style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
//             ),
//           ),
//           //======================================================== State

//           Container(
//             padding: EdgeInsets.only(left: 15, right: 15, top: 5),
//             color: Colors.white,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Expanded(
//                   child: DropdownButtonHideUnderline(
//                     child: ButtonTheme(
//                       alignedDropdown: true,
//                       child: DropdownButton<String>(
//                         value: _myCounties,
//                         iconSize: 30,
//                         icon: (null),
//                         style: TextStyle(
//                           color: Colors.black54,
//                           fontSize: 16,
//                         ),
//                         hint: Text('Select County'),
//                         onChanged: (newValue) {
//                           setState(() {
//                             _myCounties = newValue!;
//                             _getCitiesList();
//                             print(_myCounties);
//                           });
//                         },
//                         items: CountiesList.map((item) {
//                               return DropdownMenuItem(
//                                 value: item['county_id'].toString(),
//                                 child: new Text(item['name']),
//                               );
//                             }).toList(),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 30,
//           ),

//           //======================================================== City

//           Container(
//             padding: EdgeInsets.only(left: 15, right: 15, top: 5),
//             color: Colors.white,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Expanded(
//                   child: DropdownButtonHideUnderline(
//                     child: ButtonTheme(
//                       alignedDropdown: true,
//                       child: DropdownButton<String>(
//                         value: _myCity,
//                         iconSize: 30,
//                         icon: (null),
//                         style: TextStyle(
//                           color: Colors.black54,
//                           fontSize: 16,
//                         ),
//                         hint: Text('Select City'),
//                         onChanged: (newValue) {
//                           setState(() {
//                             _myCity = newValue!;
//                             print(_myCity);
//                           });
//                         },
//                         items: citiesList.map((item) {
//                               return new DropdownMenuItem(
//                                 value: item['city_id'].toString(),
//                                 child: Text(item['city_name']),
//                               );
//                             }).toList(),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   //=============================================================================== Api Calling here

// //CALLING STATE API HERE
// // Get State information by API
//   late List CountiesList = [];
//   late String? _myCounties ;

//   String countyInfoUrl = 'http://192.168.0.45:8079/projects/phpdata/apicrudtrial/api/counties.php';
//   Future<String> _getCountiesList() async {
//     try {
//       final response = await http.post(
//         Uri.parse(countyInfoUrl),
//         headers: {'Content-Type': 'application/json'},
//         body:{
//            jsonEncode({"name": _myCounties})     
//            },
//       );

//       if (response.statusCode == 200) {
//         var data = json.decode(response.body);
//         setState(() {
//           CountiesList = data['counties'];
//         });
//         return "Success";
//       } else {
//         return "Error: ${response.statusCode}";
//       }
//     } catch (e) {
//       return "Exception: $e";
//     }
//   }

//   // Get State information by API
//   late List citiesList = [];
//   late String? _myCity ;

//   String cityInfoUrl ='http://192.168.0.45:8079/projects/phpdata/apicrudtrial/api/cities.php';
// //   // Fetch Cities
//   Future<String> _getCitiesList() async {
//     try {
//       final response = await http.post(
//         Uri.parse(cityInfoUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: {
//           jsonEncode({"city_name": _myCity})
//           },
//       );

//       if (response.statusCode == 200) {
//         var data = json.decode(response.body);
//         setState(() {
//           citiesList = data['cities'] ?? [];
//         });
//         return "Success";
//       } else {
//         return "Error: ${response.statusCode}";
//       }
//     } catch (e) {
//       return "Exception: $e";
//     }
//   }
// }
