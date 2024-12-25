import 'dart:io';

main() async{
  print('Enter :');
  int? r = int.tryParse(stdin.readLineSync()!);
  int? re = int.tryParse(stdin.readLineSync()!);
  sum(a: r, b: re);
  

}

Future<int>? sum({required int? a,required int? b}) {
  Future.delayed(const Duration(seconds: 6),(){
    var s = a!+b!;
    print("$s");
  });
}