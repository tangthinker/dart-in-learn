import 'package:dart_in_learn/dart_in_learn.dart' as dart_in_learn;
import 'package:dart_in_learn/_1_intro.dart' as _1_intro;

void main(List<String> arguments) {

  print('arguments: $arguments');

  print('Hello world: ${dart_in_learn.calculate()}!');

  var choose = arguments[0];
  switch (choose) {
    case '1':
      _1_intro.intro();
  }
}
