// // To parse this JSON data, do
// //
// //     final itunes = itunesFromJson(jsonString);

// import 'dart:convert';

// Itunes itunesFromJson(String str) => Itunes.fromJson(json.decode(str));

// String itunesToJson(Itunes data) => json.encode(data.toJson());

// class Itunes {
//     Itunes({
//         this.resultCount,
//         this.results,
//     });

//     int resultCount;
//     List<Result> results;

//     factory Itunes.fromJson(Map<String, dynamic> json) => Itunes(
//         resultCount: json["resultCount"],
//         results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "resultCount": resultCount,
//         "results": List<dynamic>.from(results.map((x) => x.toJson())),
//     };
// }

// class Result {
//     Result({
//         this.wrapperType,
//         this.kind,
//         this.artistId,
//         this.collectionId,
//         this.trackId,
//         this.artistName,
//         this.collectionName,
//         this.trackName,
//         this.collectionCensoredName,
//         this.trackCensoredName,
//         this.artistViewUrl,
//         this.collectionViewUrl,
//         this.feedUrl,
//         this.trackViewUrl,
//         this.artworkUrl30,
//         this.artworkUrl60,
//         this.artworkUrl100,
//         this.collectionPrice,
//         this.trackPrice,
//         this.trackRentalPrice,
//         this.collectionHdPrice,
//         this.trackHdPrice,
//         this.trackHdRentalPrice,
//         this.releaseDate,
//         this.collectionExplicitness,
//         this.trackExplicitness,
//         this.trackCount,
//         this.country,
//         this.currency,
//         this.primaryGenreName,
//         this.artworkUrl600,
//         this.genreIds,
//         this.genres,
//         this.contentAdvisoryRating,
//     });

//     String wrapperType;
//     String kind;
//     int artistId;
//     int collectionId;
//     int trackId;
//     String artistName;
//     String collectionName;
//     String trackName;
//     String collectionCensoredName;
//     String trackCensoredName;
//     String artistViewUrl;
//     String collectionViewUrl;
//     String feedUrl;
//     String trackViewUrl;
//     String artworkUrl30;
//     String artworkUrl60;
//     String artworkUrl100;
//     int collectionPrice;
//     int trackPrice;
//     int trackRentalPrice;
//     int collectionHdPrice;
//     int trackHdPrice;
//     int trackHdRentalPrice;
//     DateTime releaseDate;
//     String collectionExplicitness;
//     String trackExplicitness;
//     int trackCount;
//     String country;
//     String currency;
//     String primaryGenreName;
//     String artworkUrl600;
//     List<String> genreIds;
//     List<String> genres;
//     String contentAdvisoryRating;

//     factory Result.fromJson(Map<String, dynamic> json) => Result(
//         wrapperType: json["wrapperType"],
//         kind: json["kind"],
//         artistId: json["artistId"],
//         collectionId: json["collectionId"],
//         trackId: json["trackId"],
//         artistName: json["artistName"],
//         collectionName: json["collectionName"],
//         trackName: json["trackName"],
//         collectionCensoredName: json["collectionCensoredName"],
//         trackCensoredName: json["trackCensoredName"],
//         artistViewUrl: json["artistViewUrl"],
//         collectionViewUrl: json["collectionViewUrl"],
//         feedUrl: json["feedUrl"],
//         trackViewUrl: json["trackViewUrl"],
//         artworkUrl30: json["artworkUrl30"],
//         artworkUrl60: json["artworkUrl60"],
//         artworkUrl100: json["artworkUrl100"],
//         collectionPrice: json["collectionPrice"],
//         trackPrice: json["trackPrice"],
//         trackRentalPrice: json["trackRentalPrice"],
//         collectionHdPrice: json["collectionHdPrice"],
//         trackHdPrice: json["trackHdPrice"],
//         trackHdRentalPrice: json["trackHdRentalPrice"],
//         releaseDate: DateTime.parse(json["releaseDate"]),
//         collectionExplicitness: json["collectionExplicitness"],
//         trackExplicitness: json["trackExplicitness"],
//         trackCount: json["trackCount"],
//         country: json["country"],
//         currency: json["currency"],
//         primaryGenreName: json["primaryGenreName"],
//         artworkUrl600: json["artworkUrl600"],
//         genreIds: List<String>.from(json["genreIds"].map((x) => x)),
//         genres: List<String>.from(json["genres"].map((x) => x)),
//         contentAdvisoryRating: json["contentAdvisoryRating"] == null ? null : json["contentAdvisoryRating"],
//     );

//     Map<String, dynamic> toJson() => {
//         "wrapperType": wrapperType,
//         "kind": kind,
//         "artistId": artistId,
//         "collectionId": collectionId,
//         "trackId": trackId,
//         "artistName": artistName,
//         "collectionName": collectionName,
//         "trackName": trackName,
//         "collectionCensoredName": collectionCensoredName,
//         "trackCensoredName": trackCensoredName,
//         "artistViewUrl": artistViewUrl,
//         "collectionViewUrl": collectionViewUrl,
//         "feedUrl": feedUrl,
//         "trackViewUrl": trackViewUrl,
//         "artworkUrl30": artworkUrl30,
//         "artworkUrl60": artworkUrl60,
//         "artworkUrl100": artworkUrl100,
//         "collectionPrice": collectionPrice,
//         "trackPrice": trackPrice,
//         "trackRentalPrice": trackRentalPrice,
//         "collectionHdPrice": collectionHdPrice,
//         "trackHdPrice": trackHdPrice,
//         "trackHdRentalPrice": trackHdRentalPrice,
//         "releaseDate": releaseDate.toIso8601String(),
//         "collectionExplicitness": collectionExplicitness,
//         "trackExplicitness": trackExplicitness,
//         "trackCount": trackCount,
//         "country": country,
//         "currency": currency,
//         "primaryGenreName": primaryGenreName,
//         "artworkUrl600": artworkUrl600,
//         "genreIds": List<dynamic>.from(genreIds.map((x) => x)),
//         "genres": List<dynamic>.from(genres.map((x) => x)),
//         "contentAdvisoryRating": contentAdvisoryRating == null ? null : contentAdvisoryRating,
//     };
// }
