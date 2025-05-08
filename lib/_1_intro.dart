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
  
  var vigor = Person("vigor", DateTime(2000, 7, 11), Color.yellow);

  vigor.introduction();
  
  var tangthinker = Man('tangthinker', DateTime(2001, 4, 20), Color.yellow, "coding");

  tangthinker.introduction();

  vigor.printWithDelay(Duration(seconds:  3));

  print('this is first than up line');

}

int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}


class Person extends Model{
  String name;
  DateTime? birthday;
  Color skin;


  int? get age => birthday != null ? DateTime.now().year - birthday!.year : 0;

  Person(this.name, this.birthday, this.skin);

  Person.nonBorn(String name, Color skin) : this(name, null, skin);

  @override
  void introduction() {
    print('My name is $name');
    print('I born at $birthday');
    if (birthday != null) {
      print('Now I am $age years old');
    }
    print('And the color of my skin is $skin');
  }

  Future<void> printWithDelay(Duration duration) async {
    await Future.delayed(duration);
    introduction();
  }

}


enum Color {
  red, black, white, yellow
}

class Man extends Person with Hand{
  String hobby;

  Man(super.name, DateTime super.birthday, super.skin, this.hobby) {
    fingerSize = 5;
  }
  
  @override
  void introduction() {
    super.introduction();
    print('I am a man, and My hobby is $hobby');
    printFingerSize();
  }
}


mixin Hand {
  int fingerSize = 5;

  void printFingerSize() {
    print('And I have $fingerSize finger for each hand');
  }
}


abstract class Model {
  void introduction();
}