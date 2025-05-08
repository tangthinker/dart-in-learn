void intro() {
  print('1. introduction');


  var name = 'Vigor 711';
  var year = 2000;
  var pi = 3.14;
  var arr = [1, 1, 2, 3, 5, 8];
  var req = {
    'name': 'vigor 711',
    'age': 21
  };
  for (final ele in arr) {
    print(ele);
  }

  while (year < 2025) {
    print('now year is $year');
    year++;
  }
  print('finally year is $year');

  print('fibonacci 9 is ${fibonacci(9)}');
  
  arr.where((int num) => num.isEven).forEach(print);
  
  var vigor = Person("vigor", DateTime(2000, 7, 11));

  vigor.introduction();

}

int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}


class Person {
  String name;
  DateTime? birthday;

  int? get age => birthday != null ? DateTime.now().year - birthday!.year : 0;

  Person(this.name, this.birthday);

  Person.nonBorn(String name) : this(name, null);

  void introduction() {
    print('My name is $name');
    print('I born at $birthday');
    if (birthday != null) {
      print('Now I am $age years old');
    }
  }



}