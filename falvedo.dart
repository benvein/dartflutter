void main() {
  String falvedo = """Mindenki
Igaza
Sajátja
SZUBJEKTÍV
IGAZSÁG
Objektív
Nincs is az""";

  print(falvedo);
  print("-----------------");
  print(falvedo.toLowerCase());
  print("-----------------");
  print(falvedo.toUpperCase());
  print("-----------------");
  print(falvedo.trim());
  print("-----------------");
  print(falvedo.replaceAll(" ", "-"));
  print("-----------------");
  print("... ${falvedo.substring(5)}");
  print("-----------------");
  print(falvedo.codeUnitAt(3));
  print("-----------------");
  print("${falvedo.substring(10)} ...");
}
