void main() {
  List<int> fiboList = [];
  int a = 0, b = 1;

  while (a < 30) {
    fiboList.add(a);
    int next = a + b;
    a = b;
    b = next;
  }

  var fiboSquare = fiboList.map((n) => n * n);

  print(fiboSquare);

  //feladat6
  List<int> fiboListParatlan = [];
  for (var i = 0; i < fiboList.length; i++) {
    if (i % 2 != 0) {
      fiboListParatlan.add(fiboList[i]);
    }
  }

  /*List<int> fiboSqParatlan = [];
  for (var i = 0; i < fiboSquare.length; i++) {
    if (i % 2 != 0) {
      fiboSqParatlan.add(fiboSquare[i]);
    }
  }*/

 // List<int> combinedList = [...fiboListParatlan, ...fiboSqParatlan];

  //print(combinedList.reversed);
}
