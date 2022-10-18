import 'package:auto_route/annotations.dart';
import 'package:todo/presentation/home/home_page.dart';
import 'package:todo/presentation/signup/signup_page.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: SignupPage, initial: true),
  AutoRoute(page: HomePage, initial: false),
])
class $AppRouter {}
