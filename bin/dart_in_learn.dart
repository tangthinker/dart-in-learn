import 'package:dart_in_learn/_1_intro.dart' as _1_intro;
import 'package:dart_in_learn/_2_variable.dart' as _2_variable;

void main(List<String> arguments) {

  var choose = arguments[0];
  switch (choose) {
    case '1':
      _1_intro.intro();
    case '2':
      _2_variable.variable();
  }
}
