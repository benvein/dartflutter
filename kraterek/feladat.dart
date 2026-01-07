import "dart:io";
import "dart:math";

void main() {
  File file = File("../kraterek/felszin.tpont.txt");

  List<Map<String, Object>> kraterek = [];
  List<String> tartalom = file.readAsLinesSync();

  for (var sor in tartalom) {
    List<String> adat = sor.trim().split('\t');
    kraterek.add({
      "x": double.tryParse(adat[0])!,
      "y": double.tryParse(adat[1])!,
      "r": double.tryParse(adat[2])!,
      'nev': adat[3],
    });
  }

  print('2. feladat: ');
  print('a kraterek szama: ${kraterek.length}');

  print('3. feladat: ');
  print("kérem egy kráternek a nevét: ");
  String name = stdin.readLineSync()!;
  String kiiratando = "nincs ilyen nevű kráter";
  for (var krater in kraterek) {
    if (name == krater['nev']) {
      kiiratando =
          "A(z) ${krater['nev']} középpontja X=${krater['x']} Y=${krater['y']} sugara R=${krater['r']}";
      break;
    }
  }
  print(kiiratando);

  print('4. feladat');

  Map<String, Object> legnagyobb = kraterek[0];
  for (var krater in kraterek) {
    if ((legnagyobb['r'] as double) < (krater['r'] as double)) {
      legnagyobb = krater;
    }
  }

  print(
    'A legnagyobb kráter neve és sugara: ${legnagyobb['nev']} R=${legnagyobb['r']}',
  );

  print("6. feladat");
  name = stdin.readLineSync()!;
  Map<String, Object> megadott = {};
  stdout.write("Nincs közös része: ");
  List<String> nemKozos = [];
  for(var krater in kraterek){
    if(){
        nemKozos.add(krater['nev'] as String);
    }
  }
  print('${nemKozos.join(', ')}.');
}


//5. feladat

double tavolsag(double x1,double y1,double x2,double y2)=>
    sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1));
