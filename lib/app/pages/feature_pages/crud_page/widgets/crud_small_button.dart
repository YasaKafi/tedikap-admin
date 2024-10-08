import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/common/themes.dart';

class CrudSmallButton extends StatelessWidget {
  final String title;
  final IconData iconData;
  final String routeName;

  const CrudSmallButton({super.key,
    required this.title,
    required this.iconData,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(routeName);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(iconData, color: white, size: 50),
            Text(
              textAlign: TextAlign.center,
              title,
              style: button.copyWith(
                // color: white,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
