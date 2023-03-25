import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:warpe_dashboard_task/presentation/screens/admin/profile_settings.dart';

import '../toast.dart';

class AppBarActionItems extends StatelessWidget {
  const AppBarActionItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            icon: SvgPicture.asset(
              'assets/calendar.svg',
              width: 20,
            ),
            onPressed: () {
              showToast("Calendar");
            }),
        const SizedBox(width: 10),
        IconButton(
            icon: SvgPicture.asset('assets/ring.svg', width: 20.0),
            onPressed: () {
              showToast("Ring");
            }),
        const SizedBox(width: 15),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                showToast("Profile clicked");
                Get.to(() => const SettingsUI());
              },
              child: const CircleAvatar(
                radius: 17,
                backgroundImage: NetworkImage(
                  'https://cdn.shopify.com/s/files/1/0045/5104/9304/t/27/assets/AC_ECOM_SITE_2020_REFRESH_1_INDEX_M2_THUMBS-V2-1.jpg?v=8913815134086573859',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
