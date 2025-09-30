void main() {
  List<int> fiboList = [];
  int a = 0, b = 1;

  while (a < 30) {
    fiboList.add(a);
    int next = a + b;
    a = b;
    b = next;
  }

  print(fiboList);

  //feladat4
  print(fiboList.length);
  print(fiboList.first);
  print(fiboList.last);
  print(fiboList[3]);
  print(fiboList.indexOf(8));
  print(fiboList.reversed);
  print(fiboList.isNotEmpty);

  fiboList.clear();
  print(fiboList.isEmpty);
  fiboList.add(34);
  fiboList.addAll([1, 2, 3, 5, 7]);
  fiboList.insertAll(fiboList.indexOf(34), [0, 1]);
  fiboList.removeLast();
  fiboList.addAll([8, 13, 21]);
  print(fiboList);
  fiboList.removeAt(0);
  print(fiboList);
}
