
void main() {

  Map<DateTime, List<int>> eventSource = {};

  Map<DateTime, List<int>> hive = {
    DateTime(2022,8,20,15,00) : [20],
    DateTime(2022,8,15,17,44) : [15],
    DateTime(2022,8,20,15,11) : [10]
  };


 hive.forEach((hiveKey, hiveValue) {
   String date = hiveKey.toString().substring(0, 11);
   DateTime dateTime = DateTime.parse('$date${'00:00:00.000'}');

   if(eventSource.containsKey(dateTime)) {
     eventSource.update(dateTime, (value) => value+hiveValue);
   }
   else {
     eventSource.addAll({dateTime : hiveValue});
   }
 });


  print(eventSource.values.toList());
}



