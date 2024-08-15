import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import '../../../../routes/AppPages.dart';
import '../../../api/promo/promo_service.dart';
import '../../../data/model/data_helper.dart';
import '../../../data/model/product/data_model.dart';
import '../../../data/model/promo/promo_response.dart';

class EditVoucherController extends GetxController {
  late final int id;
  Rx<File?> selectedImage = Rx<File?>(null);
  RxBool isLoading = false.obs;
  PromoService promoService = PromoService();
  late PromoResponse promoResponse;
  var promoResponseModel = <Data>[].obs;

  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController discountController;
  late TextEditingController maxDiscountController;
  late TextEditingController minTransactionController;
  late TextEditingController startDateController;
  late TextEditingController endDateController;

  late String imageUrl;
  final RxString imagePath = ''.obs;

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null && Get.arguments.containsKey('id')) {
      id = Get.arguments['id'] as int;
      loadData();
    } else {
      Get.snackbar("Error", "No ID found in arguments");
      Get.back();
    }

    final Map<String, dynamic> arguments = Get.arguments;
    titleController = TextEditingController(text: arguments['title']);
    descriptionController =
        TextEditingController(text: arguments['description']);
    discountController =
        TextEditingController(text: arguments['discount'].toString());
    maxDiscountController =
        TextEditingController(text: arguments['max_discount'].toString());
    minTransactionController =
        TextEditingController(text: arguments['min_transaction'].toString());
    startDateController = TextEditingController(text: arguments['start_date']);
    endDateController = TextEditingController(text: arguments['end_date']);
    imageUrl = arguments['image'];
  }

  void setImagePath(String path) {
    imagePath.value = path;
    update();
  }

  // void pickImage() async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(
  //     source: ImageSource.gallery,
  //   );

  //   if (pickedFile != null) {
  //     setImagePath(pickedFile.path);
  //   }
  // }

  void setImage(XFile? image) {
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  void loadData() async {
    isLoading.value = true;
    try {
      // Simulate data loading
      await Future.delayed(Duration(seconds: 2));
      // Here you can fetch data from the server using the `id`
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", "Failed to load data");
    }
  }

  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
    );
    if (pickedDate != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }

  Future<void> deleteVoucher() async {
    try {
      isLoading.value = true;
      final response = await promoService.deletePromo(id);
      print("Response: $response");

      isLoading.value = false;
      Get.snackbar("Delete voucher", "Voucher deleted successfully!");
      Get.toNamed(Routes.NAVBAR + Routes.VOUCHER_VIEW);
    } catch (e) {
      isLoading.value = false;
      print("Error: $e");
      Get.snackbar("Error", e.toString());
    }
  }

  // Future<void> editVoucher() async {
  //   try {
  //     isLoading.value = true;

  //     // Parse text inputs to integers
  //     int discount = DataHelper.parseInt(discountController.text) ?? 0;
  //     int maxDiscount = DataHelper.parseInt(maxDiscountController.text) ?? 0;
  //     int minTransaction =
  //         DataHelper.parseInt(minTransactionController.text) ?? 0;

  //     final response = await promoService.updatePromo(
  //       id: id,
  //       title: titleController.text,
  //       description: descriptionController.text,
  //       discount: discount,
  //       maxDiscount: maxDiscount,
  //       minTransaction: minTransaction,
  //       startDate: startDateController.text,
  //       endDate: endDateController.text,
  //       imageFile: selectedImage.value,
  //     );

  //     isLoading.value = false;

  //     update();

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       promoResponseModel.value = DataHelper.parseJsonList<Data>(
  //           response.data['data'], (json) => Data.fromJson(json));

  //       Get.offAndToNamed(Routes.NAVBAR + Routes.VOUCHER_VIEW);
  //       Get.snackbar("Edit voucher", "Voucher edited successfully!");
  //     } else {
  //       print("Error Response: ${response.data}");
  //       Get.snackbar("Error", "Failed to edit voucher");
  //     }
  //   } catch (e) {
  //     isLoading.value = false;
  //     print("Error: $e");
  //     Get.snackbar("Error", e.toString());
  //     throw Exception(e);
  //   }
  // }

Future<void> editVoucher() async {
  try {
    isLoading.value = true;

    // Parse text inputs to integers
    int discount = DataHelper.parseInt(discountController.text) ?? 0;
    int maxDiscount = DataHelper.parseInt(maxDiscountController.text) ?? 0;
    int minTransaction = DataHelper.parseInt(minTransactionController.text) ?? 0;

    final response = await promoService.updatePromo(
      id: id,
      title: titleController.text,
      description: descriptionController.text,
      discount: discount,
      maxDiscount: maxDiscount,
      minTransaction: minTransaction,
      startDate: startDateController.text,
      endDate: endDateController.text,
      imageFile: selectedImage.value,
    );

    isLoading.value = false;
    update();

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Example response format check
      if (response.data['data'] is List) {
        promoResponseModel.value = DataHelper.parseJsonList<Data>(
          response.data['data'], 
          (json) => Data.fromJson(json)
        );
      } else if (response.data['data'] is Map<String, dynamic>) {
        // Handle if the response is a single object
        var parsedData = DataHelper.parseJson<Data>(
          response.data['data'], 
          (json) => Data.fromJson(json)
        );
        promoResponseModel.value = [parsedData];
      }

      Get.offAndToNamed(Routes.NAVBAR + Routes.VOUCHER_VIEW);
      Get.snackbar("Edit voucher", "Voucher edited successfully!");
    } else {
      print("Error Response: ${response.data}");
      Get.snackbar("Error", "Failed to edit voucher");
    }
  } catch (e) {
    isLoading.value = false;
    print("Error: $e");
    Get.snackbar("Error", e.toString());
  }
}

}
