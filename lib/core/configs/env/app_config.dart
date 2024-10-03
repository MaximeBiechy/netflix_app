import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String apiKey = dotenv.env['TMDB_API_KEY'] ?? '';
  static String baseApiUrl = 'https://api.themoviedb.org/3';
}