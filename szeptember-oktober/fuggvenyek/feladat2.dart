int terfogat(int a, int b, int c) => a * b * c;
int felulet(int a, int b, int c) => 2 * (a * b + a * c + b * c);
int abTerulete(int a, int b) => 2 * (a + b);
int acTerulete(int a, int c) => 2 * (a + c);
int bcTerulete(int c, int b) => 2 * (b + c);
void main() {
  int a = 3;
  int b = 5;
  int c = 6;

  print(terfogat(a, b, c));
  print(felulet(a, b, c));
  print(abTerulete(a, b));
  print(acTerulete(a, c));
  print(bcTerulete(b, c));
}
