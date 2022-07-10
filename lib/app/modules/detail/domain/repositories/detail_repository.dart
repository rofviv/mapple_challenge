import 'package:dio/dio.dart';

import '../../../../domain/responses/default_response.dart';
import '../models/item_product_dto.dart';

abstract class DetailRepository {
  Future<DefaultResponse<ItemProductDto?>> getItem({required String id});
}

class DetailRepositoryImpl implements DetailRepository {
  final Dio dio;

  DetailRepositoryImpl({required this.dio});

  @override
  Future<DefaultResponse<ItemProductDto?>> getItem({required String id}) async {
    try {
      final res = await dio.get('/items/$id');
      if (res.data['error'] == null) {
        return DefaultResponse(
          200,
          "ok",
          ItemProductDto.fromMap(res.data),
        );
      }
      return DefaultResponse(
        400,
        res.data['error'],
        null,
      );
    } catch (e) {
      return DefaultResponse(
        400,
        e.toString(),
        null,
      );
    }
  }
}
