import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:assk_connect/core/constants/app_constants.dart';
import 'package:assk_connect/core/config/app_config.dart';
import 'package:assk_connect/core/routing/app_router.dart';
import 'package:assk_connect/shared/themes/app_theme.dart';
import 'package:assk_connect/core/providers/app_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize app configuration
  await AppConfig.initialize();
  
  runApp(
    const ProviderScope(
      child: AsSKConnectApp(),
    ),
  );
}

class AsSKConnectApp extends ConsumerWidget {
  const AsSKConnectApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final themeMode = ref.watch(themeModeProvider);
    
    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: router,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
    );
  }
}
