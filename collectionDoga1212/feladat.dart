void main(){
  List<num> numbers = [1,2,5,6];
  List<num> emptyNums = [];
  List<int> oddOnesOutList = [1,1,2,2,2,3,3,4,4,4];
  List<List<int>> furaList = [[4], [], [6], [2], [], [1]];
  String text = "aabbcgee";
  print(flattenAndSort(furaList));
  print(sum(numbers));
  print(sum(emptyNums));
}

num sum(List<num> arr) {
  num sumOfNumbers = 0;
  for (int i = 0; i < arr.length; i++) {
    sumOfNumbers += arr[i];
  }
  if(arr.length == 0){
    return 0;
  }
  return sumOfNumbers;
}

List<int> oddOnesOut(List<int> nums) {
  for (int number in nums) {
  }

 return [];
}

List<int> flattenAndSort(List<List<int>> nums) {
  List<int> oneDimList = [];
  for (var i = 0; i < nums.length; i++) {
    if(nums[i].isNotEmpty){
      oneDimList.addAll(nums[i]);
    }
  }

  return oneDimList;
}

int duplicateCount(String text){
  int count = 0;
  List<String> letterList = [];
  letterList.addAll(text.split(''));
  for (var i = 0; i < letterList.length; i++) {
    if(letterList[i] == letterList[i]){
      count++;
    }
  }

  return count;
}