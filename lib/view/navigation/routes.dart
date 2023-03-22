import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:mideterm_fail/view/home/home_screen.dart';
import 'package:mideterm_fail/view/learning/learning_screen.dart';
import 'package:mideterm_fail/view/practice/practice_page.dart';

part 'routes.gr.dart';


@AutoRouterConfig()
class AppRouter extends _$AppRouter{

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes  = [
    // AutoRoute(page: HomePage,path: '/'),
    // AutoRoute(page: PracticePage,),
    // AutoRoute(page: LearningPage,),
  ];

}