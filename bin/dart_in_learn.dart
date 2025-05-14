import 'package:dart_in_learn/_1_intro.dart' as _1_intro;
import 'package:dart_in_learn/_2_variable.dart' as _2_variable;
import 'package:dart_in_learn/_3_concurrency.dart' as _3_concurrency;
import 'package:dart_in_learn/_4_isolate_communication.dart' as _4_isolate;
import 'package:dart_in_learn/_5_call_c.dart' as _5_call_c;

void main(List<String> arguments) {

  var choose = arguments[0];
  switch (choose) {
    case '1':
      _1_intro.intro();
    case '2':
      _2_variable.variable();
    case '3':
      _3_concurrency.concurrency();
    case '4':
      _4_isolate.isolate();
    case '5':
      _5_call_c.callC();
  }
}
