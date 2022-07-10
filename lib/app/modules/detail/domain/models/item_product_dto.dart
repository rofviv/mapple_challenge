// To parse this JSON data, do
//
//     final itemProductDto = itemProductDtoFromMap(jsonString);

import 'dart:convert';

class ItemProductDto {
    ItemProductDto({
        required this.id,
        required this.siteId,
        required this.title,
        required this.price,
        required this.currencyId,
        required this.buyingMode,
        required this.listingTypeId,
        required this.startTime,
        required this.stopTime,
        required this.condition,
        required this.permalink,
        required this.thumbnailId,
        required this.thumbnail,
        required this.secureThumbnail,
        required this.pictures,
        required this.attributes,
        required this.variations,
        required this.status,
        required this.warranty,
        required this.dateCreated,
        required this.lastUpdated,
    });

    final String id;
    final String siteId;
    final String title;
    final int price;
    final String currencyId;
    final String buyingMode;
    final String listingTypeId;
    final DateTime startTime;
    final DateTime stopTime;
    final String condition;
    final String permalink;
    final String thumbnailId;
    final String thumbnail;
    final String secureThumbnail;
    final List<Picture> pictures;
    final List<Attribute> attributes;
    final List<dynamic> variations;
    final String status;
    final String warranty;
    final DateTime dateCreated;
    final DateTime lastUpdated;

    factory ItemProductDto.fromJson(String str) => ItemProductDto.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ItemProductDto.fromMap(Map<String, dynamic> json) => ItemProductDto(
        id: json["id"],
        siteId: json["site_id"],
        title: json["title"],
        price: json["price"],
        currencyId: json["currency_id"],
        buyingMode: json["buying_mode"],
        listingTypeId: json["listing_type_id"],
        startTime: DateTime.parse(json["start_time"]),
        stopTime: DateTime.parse(json["stop_time"]),
        condition: json["condition"],
        permalink: json["permalink"],
        thumbnailId: json["thumbnail_id"],
        thumbnail: json["thumbnail"],
        secureThumbnail: json["secure_thumbnail"],
        pictures: List<Picture>.from(json["pictures"].map((x) => Picture.fromMap(x))),
        attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromMap(x))),
        variations: List<dynamic>.from(json["variations"].map((x) => x)),
        status: json["status"],
        warranty: json["warranty"],
        dateCreated: DateTime.parse(json["date_created"]),
        lastUpdated: DateTime.parse(json["last_updated"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "site_id": siteId,
        "title": title,
        "price": price,
        "currency_id": currencyId,
        "buying_mode": buyingMode,
        "listing_type_id": listingTypeId,
        "start_time": startTime.toIso8601String(),
        "stop_time": stopTime.toIso8601String(),
        "condition": condition,
        "permalink": permalink,
        "thumbnail_id": thumbnailId,
        "thumbnail": thumbnail,
        "secure_thumbnail": secureThumbnail,
        "pictures": List<dynamic>.from(pictures.map((x) => x.toMap())),
        "attributes": List<dynamic>.from(attributes.map((x) => x.toMap())),
        "variations": List<dynamic>.from(variations.map((x) => x)),
        "status": status,
        "warranty": warranty,
        "date_created": dateCreated.toIso8601String(),
        "last_updated": lastUpdated.toIso8601String(),
    };
}

class Attribute {
    Attribute({
        required this.id,
        required this.name,
        required this.valueName,
    });

    final String id;
    final String name;
    final String valueName;

    factory Attribute.fromJson(String str) => Attribute.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Attribute.fromMap(Map<String, dynamic> json) => Attribute(
        id: json["id"],
        name: json["name"],
        valueName: json["value_name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "value_name": valueName,
    };
}

class Picture {
    Picture({
        required this.id,
        required this.url,
    });

    final String id;
    final String url;

    factory Picture.fromJson(String str) => Picture.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Picture.fromMap(Map<String, dynamic> json) => Picture(
        id: json["id"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "url": url,
    };
}
