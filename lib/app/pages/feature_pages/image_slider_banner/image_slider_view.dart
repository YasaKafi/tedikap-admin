import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/image_slider_banner/image_slider_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/image_slider_banner/widgets/slider_banner.dart';
import 'package:tedikap_admin/common/constant.dart';

import '../../../../common/themes.dart';
import '../../../../routes/AppPages.dart';
import '../../global_components/button.dart';

class ImageSliderView extends GetView<ImageSliderController> {
  const ImageSliderView({super.key});

  Future<void> refreshData() async {
    await controller.getImageSlider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Get.toNamed(Routes.TAMBAH_IMAGE_BANNER);
        },
        child: const Icon(
          Icons.add,
          color: white,
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Image slider banner',
          style: appBarText,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: refreshData,
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.imageSliderResponseModel.isEmpty) {
            return ListView(children: [
              SizedBox(
                height: Get.height * 0.7,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        orderEmptyIcon,
                        width: 150,
                        height: 150,
                      ),
                      const SizedBox(height: 20),
                      Text('No Image slide banner available',
                          style: normalText),
                    ],
                  ),
                ),
              ),
            ]);
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: controller.imageSliderResponseModel.length,
              itemBuilder: (BuildContext context, int index) {
                final boxPromo = controller.imageSliderResponseModel[index];
                return SliderBanner(
                  id: boxPromo.id!,
                  image: boxPromo.image!,
                );
              },
            );
          }
        }),
      ),
    );
  }
}
