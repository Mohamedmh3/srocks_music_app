import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  final String serviceTitle;

  const DetailScreen({Key? key, required this.serviceTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Service Details',
          style: GoogleFonts.syne(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        backgroundColor: const Color(0xff18171c),
        foregroundColor: Colors.white,
        iconTheme: IconThemeData(size: 24.sp, color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Text(
            'You tapped on: $serviceTitle',
            style: GoogleFonts.syne(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
