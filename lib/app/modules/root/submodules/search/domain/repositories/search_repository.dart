import 'package:dio/dio.dart';

import '../../../../../../domain/responses/default_response.dart';
import '../responses/search_response.dart';

abstract class SearchRepository {
  Future<DefaultResponse<SearchReponse?>> search({required String query, required int page});
}

class SearchRepositoryImpl extends SearchRepository {
  final Dio dio;

  SearchRepositoryImpl({required this.dio});

  @override
  Future<DefaultResponse<SearchReponse?>> search({
    required String query,
    required int page,
  }) async {
    try {
      final res = await dio.get('/sites/MLU/search?q=$query&offset=$page&limit=25');
      final data = SearchReponse.fromMap(res.data);
      if (data.results.isNotEmpty) {
        return DefaultResponse(
          200,
          "ok",
          data,
        );
      }
      return DefaultResponse(
        400,
        "No results",
        data,
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
