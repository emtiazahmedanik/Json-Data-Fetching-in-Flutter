main() async{
  print('async starting...');
  await Future.delayed(Duration(seconds: 3),(){print('after 3 sec');});
  print(' wait done');
}