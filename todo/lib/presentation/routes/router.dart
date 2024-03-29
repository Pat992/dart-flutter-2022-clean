import 'package:auto_route/annotations.dart';
import 'package:todo/presentation/home/home_page_v2.dart';
import 'package:todo/presentation/signup/signup_page.dart';
import 'package:todo/presentation/splash/splash_page.dart';
import 'package:todo/presentation/todo_details/todo_details_page.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: SplashPage, initial: true),
  AutoRoute(page: SignupPage, initial: false),
  AutoRoute(page: HomePage, initial: false),
  AutoRoute(page: TodoDetailsPage, initial: false),
])
class $AppRouter {}
