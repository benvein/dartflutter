void main() {
  List<int> list = [];
  for (var i = 0; i < 10; i++) {
    if (i % 2 == 0) {
      list.add(1);
    } else {
      list.add(0);
    }
  }

  print(list);
}
