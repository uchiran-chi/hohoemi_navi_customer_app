import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hohoemi_navi_customer_app/route/route_controller.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  // runApp(const ProviderScope(child: App()));

  await initializeDateFormatting('ja_JP').then(
    (_) {
      runApp(
        const ProviderScope(
          child: App(),
        ),
      );
    },
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routeProvider);

    return MaterialApp.router(
      title: 'hohoemi-navi-for-partner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Color(0xFFECA5B8),
          ),
          scaffoldBackgroundColor: const Color(0xFFFAE5EB),
          indicatorColor: Color(0xFFE76992),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              maximumSize: const Size.fromWidth(double.infinity),
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              backgroundColor: const Color(0xFFF1B3C5),
              foregroundColor: const Color(0xFFFFFFFF),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: ElevatedButton.styleFrom(
              maximumSize: const Size.fromWidth(double.infinity),
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              backgroundColor: const Color(0xFFFFFFFF),
              foregroundColor: const Color(0xFFF1B3C5),
              side: const BorderSide(color: Color(0xFFF1B3C5), width: 1.0),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
                borderRadius: BorderRadius.circular(15),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
                borderRadius: BorderRadius.circular(15),
              ))),
      routerConfig: router,
    );
  }
}
