import 'package:bloc_state_app/bloc/cubit/list_cubit.dart';
import 'package:bloc_state_app/db/db_helper.dart';
import 'package:bloc_state_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) { 
         final cubit = ListCubit(dbHelper: DbHelper.getInstance());
        cubit.fetchData();
        return cubit;
        },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc State App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppRoutes.ROUTE_SPLASH,
        routes: AppRoutes.getRoutes(),
      ),
    );
  }
}
