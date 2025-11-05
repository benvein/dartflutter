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

String fizzBuzz(int integer) {
  String result = '';
  if (integer % 3 == 0) {
    result = 'Fizz';
  }
  if (integer % 5 == 0) {
    result += 'Buzz';
  }
  if (result == '') {
    result = '$integer';
  }

  return result;
}

bool isTriangleBySides(double a, double b, double c) {
  if (a + b + c == 180 && a > 0 && b > 0 && c > 0) {
    return true;
  }
  return false;
}

bool isTriangleByAngles(double a, double b, double c) {
  if (a + b > c && b + c > a && a + c > b) {
    return true;
  }
  return false;
}

String triangleTypesByAngles(double a, double b, double c) {
  if (!isTriangleByAngles(a, b, c)) {
    return 'érvénytelen háromszög:(';
  }

  String result = "";

  if (a == c && b == c) {
    result = "egyenlo oldalu haromszog";
  }

  if ((a == b && a != c) || (b == c && b != a) || (a == c && a != b)) {
    result = "egyenloo szaru haromszog";
  }

  if (a == 90 || b == 90 || c == 90) {
    result = "derekszogu haromszog";
  }

  return result;
}
