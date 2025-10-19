import 'dart:ffi';

int _secondMax(List<int> numbers){
  int max = 0;
  int _max2 = 0;

  for(int i=0; i<numbers.length; i++){
    if(numbers[i] > max){
      _max2 = max;
      max = numbers[i];
    }else if(numbers[i] > _max2){
      _max2 = numbers[i];
    }
  }

  return _max2;
}

String _findChar(String str){
  String char = str[0];
  String result = "";
  int count = 0;
  for(int i=0; i<str.length; i++){
    if(str[i] == char){
      count++;
    }else{
      result += "$char$count";
      char = str[i];
      count = 1;
    }
  }
  result += "$char$count";
  return result;


}

main(){
  List<int> mList = const [2, 5, 4, 8, 7, 9];
  print(_secondMax(mList));
  print(_findChar("aaabbbabccc"));


}