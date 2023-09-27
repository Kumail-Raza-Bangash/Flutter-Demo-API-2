import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_demo_api_2/model.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserDetails> userDetails = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return ListView.builder(
            itemCount: userDetails.length,
            itemBuilder: (context, index){
              return Container(
                height: 200,
                decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'data'),
                          TextSpan(text: 'data'),
                        ]
                        
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
        else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

   Future<List<UserDetails>> getData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(Map<String, dynamic> index in data){
        userDetails.add(UserDetails.fromJson(index));
      }
      return userDetails;
    }
    
    else{
      return userDetails;
    }
  }
  
}


 