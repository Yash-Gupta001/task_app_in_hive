import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app_in_hive/utils/app_colors.dart';

import 'dart:developer';


class Fab extends StatelessWidget {
  const Fab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("task view");
      },
      child: Material(
        borderRadius: BorderRadius.circular(15.0.r),
        elevation: 20,
        child: Container(
          width: 70.0.w,
          height: 70.0.h,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(15.0.r),
          ),
          child: Center(
            child: Icon(
              Icons.add, 
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}