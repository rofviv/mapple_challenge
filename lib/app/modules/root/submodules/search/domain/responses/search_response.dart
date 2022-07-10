// To parse this JSON data, do
//
//     final searchReponse = searchReponseFromMap(jsonString);

import 'dart:convert';

import 'package:mapple_challenge/app/modules/root/models/models.dart';

class SearchReponse {
  SearchReponse({
    required this.siteId,
    required this.countryDefaultTimeZone,
    required this.query,
    required this.paging,
    required this.results,
  });

  final String siteId;
  final String countryDefaultTimeZone;
  final String query;
  final Paging paging;
  final List<ProductSearch> results;

  factory SearchReponse.fromJson(String str) =>
      SearchReponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SearchReponse.fromMap(Map<String, dynamic> json) => SearchReponse(
        siteId: json["site_id"],
        countryDefaultTimeZone: json["country_default_time_zone"],
        query: json["query"],
        paging: Paging.fromMap(json["paging"]),
        results: ProductSearch.fromList(json["results"]),
      );

  Map<String, dynamic> toMap() => {
        "site_id": siteId,
        "country_default_time_zone": countryDefaultTimeZone,
        "query": query,
        "paging": paging.toMap(),
        "results": List<dynamic>.from(results.map((x) => x)),
      };
}

class Paging {
  Paging({
    required this.total,
    required this.primaryResults,
    required this.offset,
    required this.limit,
  });

  final int total;
  final int primaryResults;
  final int offset;
  final int limit;

  factory Paging.fromJson(String str) => Paging.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Paging.fromMap(Map<String, dynamic> json) => Paging(
        total: json["total"],
        primaryResults: json["primary_results"],
        offset: json["offset"],
        limit: json["limit"],
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "primary_results": primaryResults,
        "offset": offset,
        "limit": limit,
      };
}
