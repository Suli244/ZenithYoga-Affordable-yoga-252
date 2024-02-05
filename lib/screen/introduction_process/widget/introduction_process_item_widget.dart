import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroductionProcessItemWidget extends StatelessWidget {
  const IntroductionProcessItemWidget({
    super.key,
    required this.imageOnBoar,
    required this.titleOnBoar,
    required this.titleTwoOnBoar,
    this.siz,
    this.sizTwo,
  });
  final String imageOnBoar;
  final String titleOnBoar;
  final String titleTwoOnBoar;
  final double? siz;
  final double? sizTwo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            imageOnBoar,
            width: 390.w,
            height: 500.h,
            alignment: Alignment.topCenter,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: sizTwo ?? 24.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  titleOnBoar,
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff0D0F45),
                    fontFamily: 'mp',
                    height: 0,
                  ),
                ),
              ),
              SizedBox(height: siz ?? 24.h),
              FittedBox(
                child: Text(
                  titleTwoOnBoar,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff5C5E8B),
                    fontFamily: 'mp',
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
