
import 'dart:isolate';

void isolate() async {
  print('4. isolate communication');

  ReceivePort mainReceivePort = ReceivePort();

  await Isolate.spawn(isolateFunction, mainReceivePort.sendPort);

  SendPort? isolateSendPort;

  mainReceivePort.listen((message) {
    if (message is SendPort) {
      isolateSendPort = message;
      isolateSendPort!.send('Hello from main.');
    } else {
      print('Main send port received: $message');
      mainReceivePort.close();
    }
  });

}


void isolateFunction(SendPort mainSendPort) {
  ReceivePort isolateReceivePort = ReceivePort();

  mainSendPort.send(isolateReceivePort.sendPort);

  isolateReceivePort.listen((message) {
    print('Isolate port received: $message');
    mainSendPort.send('Echo: $message');
  });
}