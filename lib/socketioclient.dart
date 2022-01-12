import 'dart:io';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/material.dart';

class SocketClient {
  var socket = IO.io(
      'http://localhost:4008',
      IO.OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .disableAutoConnect() // disable auto-connection
          .build());

  getSocketClient() {
    return socket;
  }
}
