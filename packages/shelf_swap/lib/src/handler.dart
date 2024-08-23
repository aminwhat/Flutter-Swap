/// Support for doing something awesome.
///
/// More dartdocs go here.
library shelf_swap;

import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:swap/swap.dart';

import 'inherited.dart';

export 'package:swap/swap.dart';

/// A [RequestHandler] that builds a widget and returns it as a response.
///
/// The widget is encoded as a [BlobNode].
Handler widget(
    Future<Widget> Function(
      BuildContext context,
    ) build) {
  return (RequestContext request) async {
    try {
      final root = InheritedShelf(
        request: request,
        child: Builder(
          builder: (context) {
            return FutureBuilder(
              future: build(context),
              builder: (context, result) {
                if (result.data case final data?) return data;
                if (result.error != null) print(result.error!);
                throw Response(statusCode: 500);
              },
            );
          },
        ),
      );

      final bytes = await encodeWidget(root);
      return Response(
        statusCode: 200,
        body: json.encode(bytes),
        headers: {
          'Content-Type': 'application/rfw',
        },
      );
    } catch (e) {
      if (e is Response) {
        return e;
      }

      rethrow;
    }
  };
}
