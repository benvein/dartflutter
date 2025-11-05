void main() {
  Set<String> week = {
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  };
  print(week);
  print(week.first);
  print(week.last);
  print(week.isEmpty);
  print(week.isNotEmpty);
  print(week.contains("Wednesday"));
  print(week.contains("szerda"));
  week.addAll([
    "workday",
    "weekend",
    "holiday",
    "public holiday",
    "bank holiday",
    "national holiday",
    "religious holiday",
    "federal holiday",
    "school holiday",
    "company holiday",
    "floating holiday",
    "seasonal holiday",
    "observed holiday",
    "half-day",
    "flexible day",
    "personal day",
    "sick day",
    "leave of absence",
    "vacation day",
    "remote workday"
  ]);

  for (String day in week) {
    print(day);
  }

  Set<String> schoolDays = {
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "holiday",
    "school holiday",
    "half-day",
    "leave of absence"
  };

  print(week.length);
  print(schoolDays.length);
  final differenceSet = week.difference(schoolDays);
  print(differenceSet);
  print(
      "${week.elementAt(2)} ${week.elementAt(3)} ${week.elementAt(7)} ${week.elementAt(11)} ${week.elementAt(13)}");
  print(
      "${schoolDays.elementAt(2)} ${schoolDays.elementAt(3)} ${schoolDays.elementAt(7)} ${schoolDays.elementAt(11)} ${schoolDays.elementAt(13)}");
}
