import 'dart:convert';

import 'package:http/http.dart' as http;
class API{
  fetchdata() async{
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);
    if(response.statusCode==200){
      return jsonDecode(response.body);
    }else{
      throw Exception('Failed to load data');
    }

  }
}