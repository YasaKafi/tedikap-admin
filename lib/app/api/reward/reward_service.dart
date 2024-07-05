import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tedikap_admin/app/api/api_endpoint.dart';
import 'package:tedikap_admin/app/api/dio_instance.dart';

class RewardService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getReward() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndpoint.reward,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> storeReward({
    required String name,
    required String description,
    required int regularPrice,
    required int largePrice,
    required String category,
    File? imageFile,
  }) async {
    try {
      final formData = FormData.fromMap({
        'name': name,
        'description': description,
        'regular_price': regularPrice,
        'large_price': largePrice,
        'category': category,
        if (imageFile != null)
          'image': await MultipartFile.fromFile(imageFile.path, filename: imageFile.path),
      });

      final response = await _dioInstance.postRequest(
        endpoint: '${ApiEndpoint.reward}/store',
        data: formData,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> updateReward({
    int? id,
    String? name,
    String? description,
    int? regularPrice,
    int? largePrice,
    String? category,
    File? imageFile,
  }) async {
    try {
      final formData = FormData.fromMap({
        if (id != null) 'id': id,
        if (name != null) 'name': name,
        if (description != null) 'description': description,
        if (regularPrice != null) 'regular_price': regularPrice,
        if (largePrice != null) 'large_price': largePrice,
        if (category != null) 'category': category,
        if (imageFile != null)
          'image': await MultipartFile.fromFile(imageFile.path, filename: imageFile.path),
      });

      final response = await _dioInstance.postRequest(
        endpoint: '${ApiEndpoint.reward}/update',
        data: formData,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> deleteReward(int id) async {
    try {
      final response = await _dioInstance.deleteRequest(
        endpoint: '${ApiEndpoint.reward}/delete/$id',
        isAuthorize: true,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getFilterReward({required String query}) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: '${ApiEndpoint.filter}/reward-product/',
          queryParameters: {
            'category': query
          },
          isAuthorize: true
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
  
}
