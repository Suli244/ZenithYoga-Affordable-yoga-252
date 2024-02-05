import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestoreButtons extends StatelessWidget {
  const RestoreButtons({
    super.key,
    required this.onPressPrivacyPolicy,
    required this.onPressTermOfService,
    required this.onPressRestorePurchases,
  });

  final Function() onPressPrivacyPolicy;
  final Function() onPressTermOfService;
  final Function() onPressRestorePurchases;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 5.w),
        InkWell(
          onTap: onPressPrivacyPolicy,
          child: const Text(
            'Privacy policy',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xff0D0F45),
            ),
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: onPressRestorePurchases,
          child: const Text(
            'Restore purchases',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xff0D0F45),
            ),
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: onPressTermOfService,
          child: const Text(
            'Terms of use',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xff0D0F45),
            ),
          ),
        ),
        SizedBox(width: 5.w),
      ],
    );
  }
}
