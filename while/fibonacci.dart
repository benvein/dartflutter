void main() {
  int a = 0;
  int b = 1;

  while (a < 100) {
    print(a);
    int temp = a + b;
    a = b;
    b = temp;
  }
}
