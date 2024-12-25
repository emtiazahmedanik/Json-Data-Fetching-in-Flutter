
import 'package:http/http.dart' as http;
main() async{
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  //fetching data in every 10 sec
  while(true){
    await Future.delayed(const Duration(seconds: 10));
    final result = await http.get(url);
    print(result.body);
  }


}