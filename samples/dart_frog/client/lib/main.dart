import 'package:client/core/config.dart';
import 'package:client/core/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swap/flutter_swap.dart';

void main() {
  SwapLogger.instance = ConsoleSwapLogger();
  runApp(const MyApp(
    config: config,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.config});

  final Config config;

  @override
  Widget build(BuildContext context) {
    return SwapConfiguration(
      client: IOHttpSwapClient(
        baseUrl: config.baseUrl,
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(
          title: 'Flutter Demo Home Page',
          config: config,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.config});

  final String title;
  final Config config;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SwapScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Builder(builder: (context) {
                  return IconButton(
                    onPressed: () {
                      context.swap.get('Hello', '/hello_page');
                    },
                    icon: Icon(Icons.cloud_circle_outlined),
                  );
                }),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Slot(
                  identifier: 'Hello',
                  notSwappedBuilder: (context) => const Text('Slot 1'),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
