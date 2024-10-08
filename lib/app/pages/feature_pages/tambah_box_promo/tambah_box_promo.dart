import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_box_promo/tambah_box_promo_controller.dart';

import '../../../../common/themes.dart';
import '../../global_components/button.dart';
import '../../global_components/textfield.dart';

class TambahBoxPromo extends GetView<TambahBoxPromoController> {
  const TambahBoxPromo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Box Promo", style: appBarText),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      InkWell(
                          onTap: () => controller.pickImage(),
                          child: Obx(() => Container(
                                margin: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: offColor, width: 2),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width,
                                child: controller.imagePath.value.isNotEmpty
                                    ? Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: FileImage(
                                              File(controller.imagePath.value),
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    : Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.add_photo_alternate,
                                              size: 50,
                                              color: offColor,
                                            ),
                                            Text(
                                              "Click to upload image",
                                              style: normalTextPrimary.copyWith(
                                                  color: offColor),
                                            )
                                          ],
                                        ),
                                      ),
                              ))),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Column(
                        children: [
                          MyTextField(
                            expand: false,
                            controller: controller.titleController,
                            hintText: "Enter the title",
                            name: "Title",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "This field cannot be empty";
                              }
                              return null;
                            },
                          ),
                          MyTextField(
                            expand: false,
                            controller: controller.subTitleController,
                            hintText: "Enter the description",
                            name: "Description",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "This field cannot be empty";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
              child: myButton(
                text: "Add",
                onPressed: () {
                  controller.addBoxPromo();
                },
                color: primaryColor,
                textColor: white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
