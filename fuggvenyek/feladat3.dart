import "dart:io";
import "dart:math";

double getNumber(){
  print("tizedes szam: ");
  double? num = double.parse(stdin.readLineSync()!);

  return num;
}

double kupTerfogat(double num) => (pow(num, 2) * pi *num) /3;
double kupFelszin(double num) => num * pi * (num*2);
void main(){
  double a = getNumber();

  print(kupFelszin(a));
  print(kupTerfogat(a));
}