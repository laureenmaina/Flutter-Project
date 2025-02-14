import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DropDownPage extends StatefulWidget {
  @override
  _DropDownPageState createState() => _DropDownPageState();
}

class _DropDownPageState extends State<DropDownPage> {
  List countiesList = [];
  String? _selectedCounty;

  List citiesList = [];
  String? _selectedCity;

 // final String baseUrl = "http://192.168.100.12:8079/projects/phpdata/apicrudtrial/api"; 
   final String baseUrl = "http://192.168.0.45:8079/projects/phpdata/apicrudtrial/api/"; 

  @override
  void initState() {
    super.initState();
    _getCountiesList();
     _getCitiesList();
  }

  Future<void> _getCountiesList() async {
    final response = await http.get(Uri.parse("$baseUrl/counties.php"));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        countiesList = data['counties'];
      });
    } else {
      print("Failed to load counties");
    }
  }

  
Future<void> _getCitiesList() async {
  final response = await http.get(Uri.parse("$baseUrl/cities.php"));

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    setState(() {
      citiesList = data['cities']; 
    });
  } else {
    print("Failed to load cities");
  }
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic DropDownList REST API'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          DropdownButtonFormField<String>(
              value: _selectedCounty,
              hint: Text('Select County'),
              onChanged: (newValue) {
                setState(() {
                  _selectedCounty = newValue;
                  _selectedCity = null;
                  
                });
              },
              items: countiesList.map<DropdownMenuItem<String>>((county) {
                return DropdownMenuItem<String>(
                  value: county['county_id'].toString(),
                  child: Text(county['name']),
                );
              }).toList(),
            ),

          SizedBox(height: 20),
       DropdownButtonFormField<String>(
          value: _selectedCity,
          hint: Text('Select City'),
          onChanged: (newValue) {
            setState(() {
              _selectedCity = newValue;
            });
          },
          items: citiesList.map<DropdownMenuItem<String>>((city) {
            return DropdownMenuItem<String>(
              value: city['city_id'].toString(),
              child: Text(city['city_name']),
            );
          }).toList(),
        ),

        ],
      ),
    );
  }
}