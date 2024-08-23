import 'dart:async';

import 'package:dart_frog/dart_frog.dart' hide Request, Handler;
import 'package:shelf_swap/shelf_swap.dart';

FutureOr<Response> onRequest(RequestContext context) {
  return widget(
    (context) async => const HelloPage(),
  )(context);
}

class HelloPage extends StatelessWidget {
  const HelloPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
