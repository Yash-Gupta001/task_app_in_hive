import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app_in_hive/data/hive_data_store.dart';
import 'package:task_app_in_hive/model/task.dart';

import '../view/home/home_view.dart';

Future<void> main() async {
  /// Initial Hive DB
  await Hive.initFlutter();

  /// Register Hive Adapter
  Hive.registerAdapter<Task>(TaskAdapter());

  /// Open box
  var box = await Hive.openBox<Task>("tasksBox");

  /// Delete data from previous day
  box.values.forEach((task) {
    if (task.createdAtTime.day != DateTime.now().day) {
      task.delete();
    } else {}
  });

  runApp(BaseWidget(child: const MyApp()));
}

class BaseWidget extends InheritedWidget {
  BaseWidget({Key? key, required this.child}) : super(key: key, child: child);
  final HiveDataStore dataStore = HiveDataStore();
  final Widget child;

  static BaseWidget of(BuildContext context) {
    final base = context.dependOnInheritedWidgetOfExactType<BaseWidget>();
    if (base != null) {
      return base;
    } else {
      throw StateError('Could not find ancestor widget of type BaseWidget');
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Hive Todo App',
          theme: ThemeData(
            textTheme: TextTheme(
              displayLarge: TextStyle(
                color: Colors.black,
                fontSize: 45.sp,
                fontWeight: FontWeight.bold,
              ),
              titleMedium: TextStyle(
                color: Colors.grey,
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
              ),
              displayMedium: TextStyle(
                color: Colors.white,
                fontSize: 21.sp,
              ),
              displaySmall: TextStyle(
                color: const Color.fromARGB(255, 234, 234, 234),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              headlineMedium: TextStyle(
                color: Colors.grey,
                fontSize: 17.sp,
              ),
              headlineSmall: TextStyle(
                color: Colors.grey,
                fontSize: 16.sp,
              ),
              titleSmall: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              titleLarge: TextStyle(
                fontSize: 40.sp,
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          home: child,
        );
      },
      child: const HomeView(), // Your app's home widget
    );
  }
}