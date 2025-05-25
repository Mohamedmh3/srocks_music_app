import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srocks_music_app/src/components/svg_icon_widget.dart';
import 'package:srocks_music_app/src/theme/app_icons.dart';
import 'package:srocks_music_app/src/theme/app_images.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = Colors.white;
    final Color unselectedColor = Colors.grey[600]!;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xff18171c),
      selectedItemColor: selectedColor,
      unselectedItemColor: unselectedColor,
      selectedLabelStyle: GoogleFonts.inter(
        fontSize: 10.sp,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: GoogleFonts.inter(fontSize: 9.sp),
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(AppImages.home, width: 24.sp, height: 24.sp),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgIcon(
            iconTitle: AppIcons.news,
            color: currentIndex == 1 ? selectedColor : unselectedColor,
          ),
          label: 'News',
        ),
        BottomNavigationBarItem(
          icon: SvgIcon(
            iconTitle: AppIcons.trace_box,
            color: currentIndex == 2 ? selectedColor : unselectedColor,
          ),
          label: 'Toolbox',
        ),
        BottomNavigationBarItem(
          icon: SvgIcon(
            iconTitle: AppIcons.project,
            color: currentIndex == 3 ? selectedColor : unselectedColor,
          ),
          label: 'Projects',
        ),
      ],
    );
  }
}
