import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF4B0082),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
      ),
      child: Text(
        text,
        style: GoogleFonts.syne(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
