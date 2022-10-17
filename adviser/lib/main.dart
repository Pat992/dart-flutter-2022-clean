import 'package:adviser/application/adviser/adviser_bloc.dart';
import 'package:adviser/application/theme/theme_service_provider.dart';
import 'package:adviser/presentation/adviser/adviser_page.dart';
import 'package:adviser/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adviser/injection.dart' as injection;
import 'package:adviser/injection.dart';
import 'package:provider/provider.dart';

void main() async {
  // Only start app after dependency injection
  WidgetsFlutterBinding.ensureInitialized();
  // Run dependency injection
  await injection.init();
  // Run init function of the Provider
  injection.getIt<ThemeServiceImpl>().init();
  runApp(ChangeNotifierProvider(
    create: (context) => injection.getIt<ThemeServiceImpl>(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeServiceImpl>(
      builder: (context, themeService, child) {
        return MaterialApp(
          theme: themeService.isDarkMode
              ? AppTheme.darkTheme
              : AppTheme.lightTheme,
          title: 'Adviser',
          home: BlocProvider(
            create: (context) => getIt<AdviserBloc>(),
            child: const AdviserPage(),
          ),
        );
      },
    );
  }
}
