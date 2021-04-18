import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';

import 'dart:convert';
import '../models/podcast_model.dart';

class PodcastIndexService {
  Future<List<Feed>> fetchPodCastIndex(String searchTerm) async {
    var baseUrl = 'https://api.podcastindex.org/api/1.0/search/byterm?q=';
    var url = Uri.parse(baseUrl + searchTerm);
    var unixTime = (DateTime.now().millisecondsSinceEpoch / 1000).round();
    var newUnixTime = unixTime.toString();
    // Change to your API key...
    var apiKey = 'YE9BH8C5YDXWMCPZM9T8';
    // Change to your API secret...
    var apiSecret = 'qQmfzdA3kGmnrChfYTuk3TnqQQj\$rPRt6RykHUDA';
    var firstChunk = utf8.encode(apiKey);
    var secondChunk = utf8.encode(apiSecret);
    var thirdChunk = utf8.encode(newUnixTime);

    var output = AccumulatorSink<Digest>();
    var input = sha1.startChunkedConversion(output);
    // var url = Uri.parse(
    //     "https://api.podcastindex.org/api/1.0/search/byterm?q=this+american&pretty");
    input.add(firstChunk);
    input.add(secondChunk);
    input.add(thirdChunk);
    input.close();
    var digest = output.events.single;

    var headers = <String, String>{
      'X-Auth-Date': newUnixTime,
      'X-Auth-Key': apiKey,
      'Authorization': digest.toString(),
      'User-Agent': 'SomethingAwesome/1.0.1'
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var cleanList = <Feed>[];
      var podcasts = podcastsFromJson(response.body);

      podcasts.feeds!.forEach((element) {
        if (element.itunesId is int && element.itunesId! > 0) {
          cleanList.add(element);
        }
      });
      print(response.statusCode);
      return cleanList;
    } else {
      print(response.statusCode);
      throw Exception('Failed to load album');
    }
  }
}
