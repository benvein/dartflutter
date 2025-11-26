void main() {
  List<int> numbers = [2, 4, 6, 8, 10, 11, 12, 13, 14, 15, 17, 19, 21];

  List<int> fizzBuzzNumbers =
      numbers.where((n) => n % 3 == 0 || n % 5 == 0).toList();

  print(fizzBuzzNumbers);

  List<String> days = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];

  List<String> myDays =
      days.where((d) => d.contains("o") || d.contains("ur")).toList();
  print(myDays);

  Set<dynamic> scores = {"A", "B", 3, 5, 4, "D", "F", 2, 1, "E", "C"};
  List<int> numberMarks = scores.where((s) => s is int).cast<int>().toList();
  print(numberMarks.sort);

  Map<String, double> gdpPerPerson = {
    "United States": 63051.40,
    "China": 10500.00,
    "Japan": 42659.70,
    "Germany": 46703.00,
    "United Kingdom": 42330.00,
    "India": 2100.00,
    "France": 41463.64,
    "Canada": 46212.10
  };

  List<double> gdpValues = gdpPerPerson.values.toList();
  gdpValues.sort;
  gdpValues.reversed;

  List<Map<String, double>> top3gpd = gdpPerPerson.removeWhere((g)=>g.value<gdpValues[3]).toList();
}
