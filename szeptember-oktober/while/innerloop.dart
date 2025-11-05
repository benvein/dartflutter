import "dart:io";

void main(){
  int? num;

  while(num == null || num<3 || num>9){
    print("szam: ");
    num = int.parse(stdin.readLineSync()!);
  }

  int i = 0;
  while(i<10){
    if(i == num){
      break;
    }
    int j = 0;
    while(j < 10){
      if(j == num){
        break;
      }

      print("i: ${i}, j: ${j}");
      j++;
    }

    i++;
  }
}