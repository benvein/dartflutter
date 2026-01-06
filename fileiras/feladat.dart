import 'dart:io';

void main() {
  File txtFile = File("../fileiras/sample.txt");
  File csvFile = File("../fileiras/sample.csv");

  txtFile.writeAsStringSync('');
  csvFile.writeAsStringSync('');

  File schoolTxt = File("../fileiras/school.txt");
  schoolTxt.writeAsStringSync(
      "SzSzC Vasvári Pál Informatikai és Gazdasági Technikum\n6722\nGutenberg u. 11 \nSzeged");

  schoolTxt.writeAsStringSync('\n13.b', mode: FileMode.append);

  File studentCsv = File("../fileiras/students.csv");
  studentCsv.writeAsStringSync('vezNev,kerNev,Varos');

  for (var i = 0; i < 4; i++) {
    print("vezetéknév: ");
    String? vezNev = stdin.readLineSync();

    print("keresztnév: ");
    String? kerNev = stdin.readLineSync();

    print("város: ");
    String? varos = stdin.readLineSync();

    studentCsv.writeAsStringSync('${vezNev},${kerNev},${varos}',
        mode: FileMode.append);
  }

  String? content = studentCsv.readAsStringSync();
  List<String> rows = content.split('\n');
  for (String row in rows) {
    List<String> data = row.split(', ');
    print('${data[0]} ${data[1]} ${data[2]}');
  }
}
