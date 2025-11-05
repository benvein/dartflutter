import "dart:io";
import "dart:math";

void main() {
  //01

  /*
  print("adj meg egy szamot: ");
  int? num = int.parse(stdin.readLineSync()!);
  num % 2 == 0 ? "a szam paros" : "a szam paratlan";

  if(num == 1){
    print("elegtelen");
  } else if(num == 2){
    print("elegseges");
  } else if(num == 3){
    print("kozepes");
  } else if(num == 4){
    print("jo");
  } else if(num == 5){
    print("kivalo");
  } else {
    print("ervenyleten");
  }

  switch(num){
    case 1:
      print("elegtelen");
      break;
    case 2:
      print("elegseges");
      break;
    case 3:
      print("kozepes");
      break;
    case 4:
      print("jo");
      break;
    case 5:
      print("kivalo");
      break;
    default:
      print("ervenytelen");
      break;
  }

  assert(num>=1 && num<=5, "nem megfelel");
  */

  //2
  /*
  print("elso szam: ");
  int? num1 = int.parse(stdin.readLineSync()!);
  print("masodik szam: ");
  int? num2 = int.parse(stdin.readLineSync()!);

  if(num1>num2){
    print("elso szam a nagyobb, elteres: ${num1-num2}");
  } else if (num2>num1){
    print("masodik szam a nagyobb, elteres: ${num2-num1}");
  } else{
    print("ket szam egyenlo, elteres 0");
  }*/

  //3
  /*
  print("adj meg egy szamot: ");
  int? num = int.parse(stdin.readLineSync()!);
  num % 2 == 0 ? "a szam paros" : "a szam paratlan";

  if (num > 0) {
    print("a szam pozitiv");
  } else if (num < 0) {
    print("a szam negativ");
  } else {
    print("a szam 0");
  }

  num % sqrt(num) == 0 ? "a szam negyzetszam" : "a szam nem negyzetszam";*/

  //4

  print("osszpontszam: ");
  int? ossz = int.parse(stdin.readLineSync()!);
  print("elert pontszam: ");
  int? elert = int.parse(stdin.readLineSync()!);

  double szazalek = elert/ossz*100;

  if(szazalek>=90 && 100>=szazalek){
    print("A");
  } else if (szazalek>=80 && 90>szazalek){
    print("B");
  } else if (szazalek>=70 && 80>szazalek){
    print("C");
  } else if (szazalek>=60 && 70>szazalek){
    print("D");
  } else if (szazalek>=50 && 60>szazalek){
    print("E");
  } else if (szazalek>=0 && 50>szazalek){
    print("F");
  } else{
    print("valami nem siekrult");
  }
}
