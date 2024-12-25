import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dart_practice/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});


  @override
  Widget build(BuildContext context) {
    dynamic response = API().fetchdata();
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: API().fetchdata(),
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator(),);
                }else if(snapshot.hasData){
                  final response = snapshot.data!;
                  if(response is List){
                    return ListView.builder(
                        itemCount: response.length,
                        itemBuilder:(context,index){
                          final item = response[index];
                          return Card(
                            margin: const EdgeInsets.all(8),
                            elevation: 5,
                            child: Column(
                              children: [
                                Text('Title:${item['title']}'),
                                SizedBox(height: 3,),
                                Text('body:${item['body']}'),
                              ],
                            ),

                          );
                        }
                    );
                  }else{
                    return const Center(child: Text('unexpected data format'),);
                  }

                }else{
                  return const Center(child: Text('No data'),);
                }
              }
          )
      ),
    );
  }
}
