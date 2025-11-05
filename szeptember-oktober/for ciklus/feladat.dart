import "dart:io";
import "dart:math";

void main() {
  //1
  /*
  print("elso szam: ");
  int? num1 = int.parse(stdin.readLineSync()!);
  print("masodik szam: ");
  int? num2 = int.parse(stdin.readLineSync()!);

  if (num1 > num2) {
    for (int i = num2; i <= num1; i++) {
      if (i % 2 == 0) {
        print("${i} paros");
      } else {
        print("${i} paratlan");
      }
    }
  } else {
    for (int i = num1; i <= num2; i++) {
      if (i % 2 == 0) {
        print("${i} paros");
      } else {
        print("${i} paratlan");
      }
    }
  }
  */

  //2
  /*
  List<String> uefa2024euro = [
    "Spain",
    "Germany",
    "Portugal",
    "France",
    "Netherlands",
    "Turkey",
    "England",
    "Switzerland"
    ];

    for(String country in uefa2024euro){
      print("${uefa2024euro.indexOf(country)}: ${country}");
    }
  */

  //3 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  /*
  List<String> uefa2024euro = [
    "Spain",
    "Germany",
    "Portugal",
    "France",
    "Netherlands",
    "Turkey",
    "England",
    "Switzerland"
    ];

  uefa2024euro.forEach()*/

  //4
  /*
  print("szam: ");
  int? num = int.parse(stdin.readLineSync()!);
  int sum = 0;
  double avg = 0;
  for (int i = 0; i <= num.toString().length; i++) {
    sum += i;
    
  }

  avg = sum / num.toString().length;

  print(avg.toStringAsFixed(2));
  */

  //5 !!!!!!!!!!!!!
  /*
  print("szam: ");
  int num = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= num.toString().length; i++) {
    print(pow(i,2));
    
  }*/

  //6
  /*
  print("szoveg: ");
  String text = stdin.readLineSync()!;

  print(text.replaceAll(RegExp('[öóüeuioőúaéáűí]'), ''));*/

  //7
  
}
