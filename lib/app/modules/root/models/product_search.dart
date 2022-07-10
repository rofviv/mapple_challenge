import 'dart:convert';

class ProductSearch {
  ProductSearch({
    required this.id,
    required this.siteId,
    required this.title,
    required this.price,
    required this.currencyId,
    required this.thumbnail,
  });

  final String id;
  final String siteId;
  final String title;
  final double price;
  final String currencyId;
  final String thumbnail;

  factory ProductSearch.fromJson(String str) =>
      ProductSearch.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductSearch.fromMap(Map<String, dynamic> json) => ProductSearch(
        id: json["id"],
        siteId: json["site_id"],
        title: json["title"],
        price: json["price"].toDouble(),
        currencyId: json["currency_id"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "site_id": siteId,
        "title": title,
        "price": price,
        "currency_id": currencyId,
        "thumbnail": thumbnail,
      };

  static List<ProductSearch> fromList(List list) =>
      list.map((e) => ProductSearch.fromMap(e)).toList();

  static List<ProductSearch> fromListJson(List list) =>
      list.map((e) => ProductSearch.fromJson(e)).toList();
}
