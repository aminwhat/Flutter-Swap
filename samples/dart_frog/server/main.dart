import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  port = 8080;

  final server = await serve(handler, ip, port);

  server..autoCompress = true;

  return server;
}
