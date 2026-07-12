import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:esportes_flutter/config/router_config.dart';
import 'package:esportes_flutter/theme/ui_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const SportsApp());
}

class SportsApp extends StatefulWidget {
  const SportsApp({super.key});

  @override
  State<SportsApp> createState() => _SportsAppState();
}

class _SportsAppState extends State<SportsApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    UiTheme.applySystemTheme();
  }

  @override
  void didChangePlatformBrightness() {
    UiTheme.applySystemTheme();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: UiTheme.theme,
      routerDelegate: routes.routerDelegate,
      routeInformationParser: routes.routeInformationParser,
      routeInformationProvider: routes.routeInformationProvider,
    );
  }
}
