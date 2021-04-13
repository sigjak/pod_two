import 'package:http/http.dart' as http;
import '../models/episodes.dart';

class EpisodeService {
  Future<List<Result>> getEpisodes(String collectionId) async {
    List<Result> result = [];
    String baseUrl =
        "https://itunes.apple.com/lookup?country=US&media=podcast&entity=podcastEpisode&limit=10&id=";

    var url = Uri.parse(baseUrl + collectionId);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Episodes episodes = episodesFromJson(response.body);
      result = episodes.results;

      // print(result.length);
      // print(result[0].collectionName);
      // print(result[0].artistName);
      // print('episodes');
      // print(result[1].releaseDate);
      // print(result[1].trackName);
      // print(result[1].shortDescription);
      // print(result[1].description);
    }
    return result;
  }
}
