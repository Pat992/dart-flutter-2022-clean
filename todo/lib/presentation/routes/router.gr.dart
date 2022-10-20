// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../domain/entities/todo/todo_entity.dart' as _i7;
import '../home/home_page.dart' as _i3;
import '../signup/signup_page.dart' as _i2;
import '../splash/splash_page.dart' as _i1;
import '../todo_details/todo_details_page.dart' as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    SignupPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SignupPage(),
      );
    },
    HomePageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    TodoDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<TodoDetailsPageRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.TodoDetailsPage(
          key: args.key,
          todo: args.todo,
        ),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          SplashPageRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
          SignupPageRoute.name,
          path: '/signup-page',
        ),
        _i5.RouteConfig(
          HomePageRoute.name,
          path: '/home-page',
        ),
        _i5.RouteConfig(
          TodoDetailsPageRoute.name,
          path: '/todo-details-page',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i5.PageRouteInfo<void> {
  const SplashPageRoute()
      : super(
          SplashPageRoute.name,
          path: '/',
        );

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.SignupPage]
class SignupPageRoute extends _i5.PageRouteInfo<void> {
  const SignupPageRoute()
      : super(
          SignupPageRoute.name,
          path: '/signup-page',
        );

  static const String name = 'SignupPageRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomePageRoute extends _i5.PageRouteInfo<void> {
  const HomePageRoute()
      : super(
          HomePageRoute.name,
          path: '/home-page',
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i4.TodoDetailsPage]
class TodoDetailsPageRoute extends _i5.PageRouteInfo<TodoDetailsPageRouteArgs> {
  TodoDetailsPageRoute({
    _i6.Key? key,
    required _i7.TodoEntity? todo,
  }) : super(
          TodoDetailsPageRoute.name,
          path: '/todo-details-page',
          args: TodoDetailsPageRouteArgs(
            key: key,
            todo: todo,
          ),
        );

  static const String name = 'TodoDetailsPageRoute';
}

class TodoDetailsPageRouteArgs {
  const TodoDetailsPageRouteArgs({
    this.key,
    required this.todo,
  });

  final _i6.Key? key;

  final _i7.TodoEntity? todo;

  @override
  String toString() {
    return 'TodoDetailsPageRouteArgs{key: $key, todo: $todo}';
  }
}
