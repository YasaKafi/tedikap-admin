// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/order_page_controller.dart';

import '../../../../../common/themes.dart';

class OrderFilter extends StatelessWidget {
  OrderController controller = Get.put(OrderController());

 @override
  final List<String> items = [
    "Newest",
    "Oldest",
    "Pickup",
    "Delivery",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            controller.setCurrentIndex(index);
          },
          child: Obx(() => AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  color: controller.currentIndex.value == index
                      ? primaryColor
                      : lightGrey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    items[index],
                    style: cardTitle.copyWith(
                      color: controller.currentIndex.value == index
                          ? white
                          : darkGrey,
                    ),
                  ),
                ),
              )),
        );
      },
    );
  }
}
