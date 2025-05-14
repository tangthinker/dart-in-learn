import 'dart:ffi' as ffi;
import 'dart:io' show Platform, Directory;
import 'package:path/path.dart' as path;

typedef HelloFunc = ffi.Void Function();

typedef Hello = void Function();

void callC(){
  print('5. call C ');

  var libPath = path.join(Directory.current.path, 'lib', 'lib_c', 'libhello.so');
  if (Platform.isMacOS) {
    libPath = path.join(Directory.current.path, 'lib', 'lib_c', 'libhello.dylib');
  }

  final dylib = ffi.DynamicLibrary.open(libPath);

  final Hello hello = dylib.lookup<ffi.NativeFunction<HelloFunc>>('hello').asFunction();

  hello();



}