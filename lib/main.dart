import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stack_trace/stack_trace.dart';

void main() {
  Chain.capture(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      runApp(const App());
    },
    onError: (error, stackTrace) {
      if (kDebugMode) {
        print('$error:\n${stackTrace.terse}');
      }
    },
    zoneValues: {#flutter.io.allow_http: false},
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
