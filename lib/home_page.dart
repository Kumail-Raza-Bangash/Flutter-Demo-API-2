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
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            itemCount: userDetails.length,
            itemBuilder: (context, index){
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                margin: const EdgeInsets.only(bottom: 10),
                height: 200,
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getText(index, "ID: ", userDetails[index].id.toString()),
                    getText(index, "Name: ", userDetails[index].name.toString()),
                    getText(index, "Email: ", userDetails[index].email.toString()),
                    getText(index, "Phone Number: ", userDetails[index].phone.toString()),
                    getText(index, "Wbsite: ", userDetails[index].website.toString()),
                    getText(index, "Company Name: ", userDetails[index].company.name.toString()),
                    getText(index, "Address: ", '${userDetails[index].address.suite.toString()}, ${userDetails[index].address.street.toString()}, ${userDetails[index].address.city.toString()} - ${userDetails[index].address.zipcode.toString()}'),
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

  Text getText(int index, String fieldName, String content) {
    return Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: fieldName, style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold,),),
                        TextSpan(text: content, style: const TextStyle(fontSize: 14, color: Colors.white,),),
                      ]
                      
                    ),
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


 