import "dart:io";

Map<String, String> getName(){
  print("vezeteknev: ");
  String vName = stdin.readLineSync()!;
  
  print("keresztnev: ");
  String kName = stdin.readLineSync()!;

  return {"vName": vName, "kName": kName};
}

String fullName() {
  Map<String, String> name = getName();
  return '${name['vName']} ${name['kName']}';
}

void main(){
  String name = fullName();
  print("nev: ${name}");
}