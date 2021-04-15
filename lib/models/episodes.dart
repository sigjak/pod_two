// To parse this JSON data, do
//
//     final episodes = episodesFromJson(jsonString);

import 'dart:convert';

Episodes episodesFromJson(String str) => Episodes.fromJson(json.decode(str));

String episodesToJson(Episodes data) => json.encode(data.toJson());

class Episodes {
  Episodes({
    this.resultCount,
    this.results,
  });

  int resultCount;
  List<Result> results;

  factory Episodes.fromJson(Map<String, dynamic> json) => Episodes(
        resultCount: json["resultCount"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "resultCount": resultCount,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.releaseDate,
    this.collectionName,
    this.trackName,
    this.episodeUrl,
    this.artworkUrl600,
    this.description,
  });

  DateTime releaseDate;
  String collectionName;
  String trackName;
  String episodeUrl;
  String artworkUrl600;
  String description;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        releaseDate: DateTime.parse(json["releaseDate"]),
        collectionName: json["collectionName"],
        trackName: json["trackName"],
        episodeUrl: json["episodeUrl"],
        artworkUrl600: json["artworkUrl600"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "releaseDate": releaseDate.toIso8601String(),
        "collectionName": collectionName,
        "trackName": trackName,
        "episodeUrl": episodeUrl,
        "artworkUrl600": artworkUrl600,
        "description": description,
      };
}
