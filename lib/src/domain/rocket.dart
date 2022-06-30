import 'dart:convert';

class RocketModel {
  RocketModel({
    required this.id,
    required this.active,
    required this.favorite,
    required this.stages,
    required this.boosters,
    required this.costPerLaunch,
    required this.successRatePct,
    required this.firstFlight,
    required this.country,
    required this.company,
    required this.flickrImages,
    required this.wikipedia,
    required this.description,
    required this.rocketName,
    required this.rocketType,
  });

  final int id;
  final bool active;
  final bool favorite;
  final int stages;
  final int boosters;
  final int costPerLaunch;
  final int successRatePct;
  final DateTime firstFlight;
  final String country;
  final String company;
  final List<String> flickrImages;
  final String wikipedia;
  final String description;
  final String rocketName;
  final String rocketType;

  factory RocketModel.fromJson(String str) =>
      RocketModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RocketModel.fromMap(Map<String, dynamic> json) => RocketModel(
        id: json["id"],
        active: json["active"],
        stages: json["stages"],
        boosters: json["boosters"],
        costPerLaunch: json["cost_per_launch"],
        successRatePct: json["success_rate_pct"],
        firstFlight: DateTime.parse(json["first_flight"]),
        country: json["country"],
        company: json["company"],
        flickrImages: List<String>.from(json["flickr_images"].map((x) => x)),
        wikipedia: json["wikipedia"],
        description: json["description"],
        rocketName: json["rocket_name"],
        rocketType: json["rocket_type"],
        favorite: false,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "active": active,
        "stages": stages,
        "boosters": boosters,
        "cost_per_launch": costPerLaunch,
        "success_rate_pct": successRatePct,
        "first_flight":
            "${firstFlight.year.toString().padLeft(4, '0')}-${firstFlight.month.toString().padLeft(2, '0')}-${firstFlight.day.toString().padLeft(2, '0')}",
        "country": country,
        "company": company,
        "flickr_images": List<dynamic>.from(flickrImages.map((x) => x)),
        "wikipedia": wikipedia,
        "description": description,
        "rocket_name": rocketName,
        "rocket_type": rocketType,
        "favorite": favorite,
      };
}
