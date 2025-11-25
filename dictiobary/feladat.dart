void main() {
  Map<String, List<String>> weekMap = {
    "Monday": ["workday", "remote workday", "national holiday"],
    'Tuesday': ["workday"],
    "Wednesday": ["workday", "school holiday"],
    "Thursday": ["workday", "national holiday"],
    "Friday": ["workday", "remote workday"],
    "Saturday": ["national holiday"],
    "Sunday": ["national holiday"],
  };

  print(weekMap.keys);
  print(weekMap.values.toList());
  print(weekMap.length);

  weekMap["Wednesday"] = ["workday", "remote workday", "national holiday"];
  weekMap["Sunday"] = [];

  weekMap.removeWhere((key, value) => value.isEmpty);
  print(weekMap);


}
