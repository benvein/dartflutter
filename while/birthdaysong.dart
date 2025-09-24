import 'dart:io';

void main(){
  int? num;

  while(num == null || num<1 || num>100){
    print("szam: ");
    num = int.parse(stdin.readLineSync()!);
  }
  int i = 0;
  while(i<num){
    print("Happy birthday!\nHappy birthday to you!");
    i++;
  }
}