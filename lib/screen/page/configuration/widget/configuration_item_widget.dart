import 'package:affordable_yoga_252/core/image/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfigurationItemWidget extends StatelessWidget {
  const ConfigurationItemWidget({
    super.key,
    required this.titl,
    required this.onTaab,
  });
  final String titl;
  final Function() onTaab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: InkWell(
        onTap: onTaab,
        child: Container(
          height: 72.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 24.h,
            ),
            child: Row(
              children: [
                Text(
                  titl,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'mp',
                    color: Color(0xff0D0F45),
                  ),
                ),
                const Spacer(),
                Image.asset(AppImages.arrowRightIcon),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
