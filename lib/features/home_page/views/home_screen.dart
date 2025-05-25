import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srocks_music_app/features/home_page/viewmodels/home_navigation_viewmodel.dart';
import 'package:srocks_music_app/features/home_page/views/widgets/cutstom_button.dart';
import 'package:srocks_music_app/features/home_page/views/widgets/input_text_form.dart';
import 'package:srocks_music_app/src/components/svg_icon_widget.dart';
import 'package:srocks_music_app/src/theme/app_icons.dart';
import 'package:srocks_music_app/src/theme/app_images.dart';
import 'package:srocks_music_app/features/home_page/views/widgets/custom_bottom_nav_bar.dart';
import 'package:srocks_music_app/features/home_page/views/widgets/service_card.dart';

import '../viewmodels/home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navViewModel = context.watch<HomeNavigationViewModel>();

    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: navViewModel.selectedIndex,
        onTap: navViewModel.onItemTapped,
      ),
      backgroundColor: Color(0xff18171c),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 350.h,
                  width: double.infinity,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffa90140),
                        Color(0xff920137),
                        Color(0xff850132),
                        Color(0xff660126),
                        Color(0xff560120),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.r),
                      bottomRight: Radius.circular(20.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          const InputTextForm(
                            hintText: 'Search "Purple Lyrics"',
                          ),
                          SizedBox(width: 17.w),
                          InkWell(
                            onTap: () {},
                            child: SvgIcon(
                              iconTitle: AppIcons.generic_avatarsvg,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 36.h),
                      Text(
                        'Claim your',
                        style: GoogleFonts.syne(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        'Free Demo',
                        style: GoogleFonts.lobster(
                          color: Colors.white,
                          fontSize: 45.sp,
                          height: 1.375,
                        ),
                      ),

                      Text(
                        'for custom Music Production',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      CustomButton(text: "Book Now"),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: -30,
                  child: Image.asset(
                    AppImages.disk,
                    width: 140.w,
                    height: 140.h,
                  ),
                ),

                Positioned(
                  bottom: 10,
                  right: -40,
                  child: Image.asset(
                    AppImages.piano,
                    width: 140.w,
                    height: 140.h,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Text(
              'Hire hand-picked Pros for popular music services',
              style: GoogleFonts.syne(color: Colors.white, fontSize: 15.sp),
            ),
            SizedBox(height: 24.h),
            Consumer<HomeViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.isLoading) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.w),
                      child: const CircularProgressIndicator(
                        color: Color(0xFF9C27B0),
                      ),
                    ),
                  );
                } else if (viewModel.errorMessage != null) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.w),
                      child: Text(
                        viewModel.errorMessage!,
                        style: GoogleFonts.inter(
                          color: Colors.red,
                          fontSize: 16.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                } else if (viewModel.services.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.w),
                      child: Text(
                        'No services found.',
                        style: GoogleFonts.inter(
                          color: Colors.white54,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  );
                } else {
                  return Column(
                    children:
                        viewModel.services.map((service) {
                          return ServiceCard(
                            service: service,
                            onTap: () {
                              context.go('/details/${service.title}');
                            },
                          );
                        }).toList(),
                  );
                }
              },
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
