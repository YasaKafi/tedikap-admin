import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/common/constant.dart';
import 'package:tedikap_admin/app/pages/global_components/navbar/navbar_controller.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/app/pages/feature_pages/chat_page/chat_admin.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/home_page_view.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/menu_admin.dart';

class MyNavBar extends StatelessWidget {
  final NavigationController controller = Get.put(NavigationController());
  final List<Widget> pages = [HomePage(), MenuPage(), ChatPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final currentPage = controller.currentPage.value;
        if (currentPage < 0 || currentPage >= pages.length) {
          return Container(); // Fallback in case of invalid index
        }
        return pages[currentPage];
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentPage.value,
          onTap: (index) {
            controller.currentPage.value = index;
          },
          backgroundColor: Colors.white,
          selectedItemColor: activeColor,
          unselectedItemColor: offColor,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                controller.currentPage.value == 0 ? homeFilledIcon : homeIcon,
                height: 24.0,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                controller.currentPage.value == 1 ? drinkFilledIcon : drinkIcon,
                height: 24.0,
              ),
              label: "Menu",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                controller.currentPage.value == 2 ? chatFilledIcon : chatIcon,
                height: 24.0,
              ),
              label: "Chat",
            ),
          ],
        ),
      ),
    );
  }
}
