import 'dart:isolate';

void concurrency() async {
  print('3. concurrency');

  print('Fetching data...');
  var data = await fetchData();
  print(data);
  print('Fetch end.');

  print('');
  print('Fetching error...');
  try {
    String data = await fetchError();
    print(data);
  } catch(e) {
    print('Caught error: $e');
  }

  print('');
  print('Count Down start...');
  await for (final value in countDown()) {
    print('now is $value');
  }
  print('Count Down end.');


  print('');
  ReceivePort receivePort = ReceivePort();
  await Isolate.spawn(isolateFunction, receivePort.sendPort);

  receivePort.listen((message) {
    print('Result from Isolate: $message');
    receivePort.close();
  });

  print('Main Isolate continues running.');


}

Future<String> fetchData() {
  return Future.delayed(Duration(seconds: 3), () => 'Data load finished.');
}

Future<String> fetchError() {
  return Future.delayed(Duration(seconds: 1), () => throw 'Error occurred.');
}

Stream<int> countDown() async* {
  for (int i = 10; i >= 0; i--) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}


void isolateFunction(SendPort sendPort) {
  int ret = 0;
  for(int i = 0; i < 10000000; i++) {
    ret += i;
  }
  sendPort.send(ret);
}