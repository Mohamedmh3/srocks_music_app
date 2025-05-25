import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srocks_music_app/features/home_page/models/service.dart';
import 'package:srocks_music_app/src/components/svg_icon_widget.dart';
import 'package:srocks_music_app/src/theme/app_icons.dart';
import 'package:srocks_music_app/src/theme/app_images.dart';

class ServiceCard extends StatelessWidget {
  final Service service;
  final VoidCallback onTap;

  const ServiceCard({Key? key, required this.service, required this.onTap})
    : super(key: key);

  SvgIcon _getIconData(String iconName) {
    switch (iconName) {
      case 'ic_music':
        return SvgIcon(iconTitle: AppIcons.music);
      case 'ic_tune':
        return SvgIcon(iconTitle: AppIcons.tune);
      case 'ic_write':
        return SvgIcon(iconTitle: AppIcons.write);
      case 'ic_mic':
        return SvgIcon(iconTitle: AppIcons.mic);
      default:
        return SvgIcon(iconTitle: AppIcons.music);
    }
  }

  String _getCardImage(String iconName) {
    switch (iconName) {
      case 'ic_music':
        return AppImages.music;
      case 'ic_tune':
        return AppImages.tune;
      case 'ic_write':
        return AppImages.writing;
      case 'ic_mic':
        return AppImages.mic;
      default:
        return AppImages.music;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      color: const Color(0xFF1A1A1A),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.15,
                child: Image.asset(
                  width: 330.w,
                  _getCardImage(service.icon),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  _getIconData(service.icon),

                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          service.title,
                          style: GoogleFonts.syne(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          service.description,
                          style: GoogleFonts.syne(
                            color: Colors.grey[400],
                            fontSize: 14.sp,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SvgIcon(iconTitle: AppIcons.arrow_right),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
