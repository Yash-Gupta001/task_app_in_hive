import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app_in_hive/extensions/space_exs.dart';
import 'package:task_app_in_hive/utils/app_colors.dart';
import 'package:task_app_in_hive/utils/constanst.dart';
import 'package:task_app_in_hive/utils/string_config.dart';
import 'package:task_app_in_hive/view/home/components/fab.dart';

import 'package:task_app_in_hive/view/home/widgets/task_widget.dart';
import 'package:lottie/lottie.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<int> testing = [1,2];
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,

      /// FAB
      floatingActionButton: const Fab(),

      /// body
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            /// Custom App Bar
            Container(
              margin: EdgeInsets.only(top: 60),
              width: double.infinity,
              height: 100.0.h,
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// progress indicator
                  SizedBox(
                    width: 25.0.w,
                    height: 25.0.h,
                    child: CircularProgressIndicator(
                      value: 1 / 3,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation(
                        AppColors.primaryColor,
                      ),
                    ),
                  ),

                  /// space
                  25.ws,

                  /// top level task info
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringConfig.mainTitle,
                        style: textTheme.displayLarge,
                      ),
                      3.hs,
                      Text("1 of 3 task", style: textTheme.titleMedium),
                    ],
                  ),
                ],
              ),
            ),

            /// Divider
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Divider(thickness: 2, indent: 100),
            ),

            /// tasks
            SizedBox(
              width: double.infinity,
              height: 745,
              child: testing.isNotEmpty ? ListView.builder(
                itemCount: testing.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Dismissible(
                    direction: DismissDirection.horizontal,
                    onDismissed: (_){
                      /// remove task from db
                    },
                    background: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delete_outline,
                          color: Colors.grey
                        ),
                        8.ws,
                        Text(
                          StringConfig.deletedTask,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),

                      ],
                    ),
                    key: Key(index.toString()),
                    child: TaskWidget()
                );
                },
              ) : Column(
                children: [
                  Lottie.asset(lottieURL),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
