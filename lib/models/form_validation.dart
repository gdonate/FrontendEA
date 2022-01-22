import 'dart:async';

mixin Validation {
  StreamTransformer<String, String> emailValidation =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.contains('@')) {
        sink.add(data);
      } else {
        return sink.addError('Must be a valid email');
      }
    },
  );

  StreamTransformer<String, String> passwordValidation =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.trim().isNotEmpty) {
        sink.add(data);
      } else {
        return sink.addError('Password is an oblligatory field');
      }
    },
  );
}
