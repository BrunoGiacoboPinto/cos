import 'package:cos/ui/core/ui/theme/app_bar.dart';
import 'package:cos/ui/core/ui/theme/button.dart';
import 'package:cos/ui/core/ui/theme/card.dart';
import 'package:cos/ui/core/ui/theme/colors.dart';
import 'package:cos/ui/core/ui/theme/input_decoration.dart';
import 'package:cos/ui/core/ui/theme/typhograpy.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:stack_trace/stack_trace.dart';

import 'di/di.dart';
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

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final Future<GetIt> _dependenciesFuture;

  @override
  void initState() {
    super.initState();
    _dependenciesFuture = getItInit();
  }

  @override
  void dispose() {
    disposetGetIt();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _dependenciesFuture,
      builder: (context, snapshot) {
        final dependencies = snapshot.data;
        return MaterialApp.router(
          theme: ThemeData(
            appBarTheme: appBarTheme,
            colorScheme: colorScheme,
            cardTheme: cardTheme,
            elevatedButtonTheme: ElevatedButtonThemeData(style: primaryButtonStyle),
            outlinedButtonTheme: OutlinedButtonThemeData(style: secondaryButtonStyle),
            inputDecorationTheme: inputDecorationTheme,
            textTheme: textTheme,
            useMaterial3: true,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          title: 'CarOnSale',
          debugShowCheckedModeBanner: false,
          routerConfig:
              snapshot.hasData &&
                  dependencies !=
                      null //
              ? buildAppRouter(dependencies)
              : GoRouter(
                  routes: [
                    GoRoute(
                      path: '/',
                      builder: (context, state) {
                        return Scaffold(
                          body: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
        );
      },
    );
  }
}
