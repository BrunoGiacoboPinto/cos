import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:stack_trace/stack_trace.dart';

import 'routing/routes.dart';

void main() {
  Chain.capture(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      Logger.root.level = kDebugMode ? Level.ALL : Level.WARNING;
      Logger.root.onRecord.listen(
        (record) {
          final message = '${record.level.name}: ${record.time}: ${record.message}';
          if (record.error != null) {
            final stackTrace = Chain.forTrace(record.stackTrace ?? StackTrace.current);
            debugPrint('$message\nError: ${record.error}\nStackTrace: ${stackTrace.terse}');
          } else {
            debugPrint(message);
          }
        },
      );

      runApp(const App());
    },
    onError: (error, stackTrace) {
      Logger.root.severe('Top-level error in main', error, stackTrace);
    },
    zoneValues: {#flutter.io.allow_http: false},
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CarOnSale',
      debugShowCheckedModeBanner: false,
      routerConfig: buildAppRouter(),
    );
  }
}
