import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/detail_reward/detail_reward_controller.dart';

import '../../../../common/constant.dart';
import '../../../../common/themes.dart';
import '../../../../routes/AppPages.dart';
import '../../global_components/button.dart';

class DetailReward extends GetView<DetailRewardController> {
  const DetailReward({super.key});


  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments =
        Get.arguments as Map<String, dynamic>?;

    if (arguments == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Center(
          child: Text("No arguments provided"),
        ),
      );
    }

    final String name = arguments['name'] ?? 'Unknown';
    final String category = arguments['category'] ?? 'Unknown';
    final int regularPoint =
        int.tryParse(arguments['regularPoint'].toString()) ?? 0;
    final int largePoint =
        int.tryParse(arguments['largePoint'].toString()) ?? 0;
    final String description =
        arguments['description'] ?? 'No description available';
    final String image = arguments['image'] ?? '';
    final int id = int.tryParse(arguments['id'].toString()) ?? 0;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              Get.toNamed(Routes.EDIT_REWARD, arguments: {
                'id': id,
                'name': name,
                'regularPoint': regularPoint.toString(),
                'largePoint': largePoint.toString(),
                'image': image,
                'description': description,
                'category': category,
              });
              controller.loadData();
            },
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              height: 40,
              width: 125,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    editIcon,
                    width: 16,
                  ),
                  Text(
                    "Edit menu",
                    style: normalText.copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://tedikap-api.rplrus.com/storage/reward-product/$image"),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(color: offColor, width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(name, style: cardText),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Text(description, style: normalText),
                              
                            ],
                          ),
                          
                          Obx(
                            () {
                              print(
                                  "Switch UI rebuild with isSwitched: ${controller.isSwitched.value}");
                              return Switch(
                                activeColor: primaryColor,
                                inactiveThumbColor: offColor,
                                trackOutlineColor:
                                    MaterialStateProperty.all(white),
                                value: controller.isSwitched.value,
                                onChanged: (value) {
                                  print("Switch toggled with value: $value");
                                  controller.toggeStockReward(value);
                                },
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(),
                          Text("Price",
                              style: normalText.copyWith(
                                  fontWeight: FontWeight.bold)),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Regular price", style: normalText),
                                  Row(
                                    children: [
                                      Text(
                                        regularPoint.toString(),
                                        // regular_point,
                                        style: cardText,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.02,
                                      ),
                                      Text(
                                        "(Point)",
                                        style: normalTextPrimary,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Large price", style: normalText),
                                  Row(
                                    children: [
                                      Text(
                                        largePoint.toString(),
                                        // large_point,
                                        style: cardText,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.02,
                                      ),
                                      Text(
                                        "(Point)",
                                        style: normalTextPrimary,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: myButtonLogo(
                  text: 'Delete menu',
                  onPressed: () {
                    Get.defaultDialog(
                        title: "Delete menu",
                        middleText: "Are you sure want to delete this menu?",
                        textConfirm: "Yes",
                        textCancel: "No",
                        onConfirm: () {
                          Get.back(); // Close the dialog first
                          controller.deleteReward();
                        },
                        onCancel: () {});
                  },
                  color: red,
                  textColor: white,
                  logo: deleteIcon,
                  logoColor: white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
