import "dart:math";

void main(){
  int szam = 10;
  print(faktorial(szam));
  print(isDivisible(10, 7));
  print(percent(1010, 376));
}

int faktorial(int number){
  int szam = 1;

  for (var i = 1; i <= number; i++) {
    szam *=i;
  }
  return szam;
}

bool isDivisible(int number1, int number2){
  if(number1%number2==0){
    return true;
  }
  return false;
}

String percent(int total, int score){
  double percenteage = score/total*100;
  return percenteage.toStringAsFixed(2);
}

String grade(int total, int points){
  double percenteage = points/total*100;
  String result = "";
  if(percenteage>=90){
    result = "A";
  } else if(percenteage<90 &&percenteage>=75){
    result = "B";
  } else if(percenteage<75 &&percenteage>=60){
    result = "C";
  } else if(percenteage<60 &&percenteage>=45){
    result = "D";
  } else if(percenteage<45){
    result = "E";
  } else{
    result="vmi nemjo";
  }
  return result;
}

String vovelUpper(String text){
  String vowels = "íaéáűeuioőúöüó";

  for (int i = 0; i < text.length; i++) {
    if(vowels.contains(text[i])){
      
    }
  }

  return "";
}