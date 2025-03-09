import 'package:bloc_state_app/splash_screen.dart';
import 'package:bloc_state_app/ui/todo_screen.dart';
import 'package:flutter/material.dart';
import '../ui/add_task_screen.dart';

class AppRoutes{
  static const String ROUTE_SPLASH =  '/';
  static const String ROUTE_TODO =  '/todo';
  static const String ROUTE_ADD_Task =  '/add_task';

  static Map<String,WidgetBuilder> getRoutes() => {
      ROUTE_SPLASH: (context) => SplashScreen(),
      ROUTE_TODO: (context) => TodoScreen(),
      ROUTE_ADD_Task: (context) => AddTaskScreen(),
  };

  
}