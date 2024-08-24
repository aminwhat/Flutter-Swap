import 'dart:async';
import 'dart:developer';
import 'package:dart_frog/dart_frog.dart';
import 'package:shelf_swap/shelf_swap.dart';

FutureOr<Response> onRequest(RequestContext context) {
  log('hello_page received');
  if (context.request.method == HttpMethod.get) {
    return widget(
      (context) async => const HelloPage(),
    )(context);
  }

  return Response(body: 'Response From Dart Frog!!!');
}

class HelloPage extends StatelessWidget {
  const HelloPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shelf = InheritedShelf.of(context);
    final page =
        int.tryParse(shelf.request.request.url.queryParameters['page'] ?? '1');
    return switch (page) {
      1 => const _Page1(),
      2 => const _Page2(),
      _ => const _Page3(),
    };
  }
}

class _Page1 extends StatelessWidget {
  const _Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Page1');
  }
}

class _Page2 extends StatelessWidget {
  const _Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Page2');
  }
}

class _Page3 extends StatelessWidget {
  const _Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Page3');
  }
}
