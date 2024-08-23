import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  if (context.request.method == HttpMethod.get) {
    return Response(body: 'Welcome to Dart Frog! The Get Method');
  }

  if (context.request.method == HttpMethod.post) {
    return Response(body: 'Welcome to Dart Frog! The Post Method');
  }

  return Response(body: 'Welcome to Dart Frog!');
}
