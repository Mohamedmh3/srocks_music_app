import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InputTextForm extends StatelessWidget {
  final String? hintText;
  const InputTextForm({super.key, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: const Color(0xFF2f2f39),
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText ?? "",
            hintStyle: GoogleFonts.inter(
              color: const Color(0xff61616b),
              fontSize: 16.sp,
            ),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.white, size: 20.sp),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 1,
                  height: 24.h,
                  color: Colors.grey.shade700,
                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                ),
                Icon(Icons.mic, color: Colors.white, size: 20.sp),
              ],
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 40.w,
              minHeight: 20.h,
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 12.h,
              horizontal: 16.w,
            ),
          ),
          style: GoogleFonts.inter(color: Colors.white, fontSize: 16.sp),
          cursorColor: Colors.deepPurpleAccent,
        ),
      ),
    );
  }
}
