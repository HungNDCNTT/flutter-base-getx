import 'package:flutter/material.dart';
import 'package:flutter_app/configs/app_configs.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/ui/pages/first_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'bindings/initial_binding.dart';
import 'common/app_themes.dart';
import 'router/route_config.dart';
import 'services/app_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// AWAIT SERVICES INITIALIZATION.
  await initServices();

  runApp(MyApp());
}

/// Is a smart move to make your Services intiialize before you run the Flutter app.
/// as you can control the execution flow (maybe you need to load some Theme configuration,
/// apiKey, language defined by the User... so load SettingService before running ApiService.
/// so GetMaterialApp() doesnt have to rebuild, and takes the values directly.
Future initServices() async {
  /// Here is where you put get_storage, hive, shared_pref initialization.
  /// or moor connection, or whatever that's async.
  await Get.putAsync(() => AppService().init());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: hideKeyboard,
      child: GetMaterialApp(
        home: FirstScreen(),
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.system,
        initialBinding: InitialBinding(),
        initialRoute: RouteConfig.firstScreen,
        getPages: RouteConfig.getPages,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          S.delegate,
        ],
        locale: Locale(AppConfigs.appLocal),
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }

  void hideKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
