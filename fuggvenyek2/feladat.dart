import "dart:io";

void main() {
  String text = "maygar nemzeti hiphop";
  print(reverseString(text));
  int number = 123;
  print(reverseInteger(number));
  num num2 = 45.23;
  print(reverseNumber(num2));
  print(sortNumbersAsc(number));
}

String reverseString(String text) =>
    text.toString().split('').reversed.join('');

int reverseInteger(int number) => int.parse(reverseString('$number'));

num reverseNumber(num number) => num.parse(reverseString('$number'));

int sortNumbersAsc(int integer) {
  List<String> strNums = '$integer'.split('');
  List<int> intNums = strNums.map((item) => int.parse(item)).toList();
  intNums.sort((a, b) => a - b);
  strNums = intNums.map((item) => '$item').toList();
  return int.parse(strNums.join());
}

int sortNumbersDes(num number) {
  List<String> strList = '$number'.replaceAll('.', '').split('');
  List<int> intList = strList.map((item) => int.parse(item)).toList();
  intList.sort((a, b) => b - a);
  String strNum = intList.map((item) => '$item').join();
  return int.parse(strNum);
}
