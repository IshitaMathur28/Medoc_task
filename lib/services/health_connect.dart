import 'package:http/http.dart' as http;

class HealthConnectService {
  final String baseUrl = 'https://health-api.example.com';

  Future<Map<String, dynamic>> fetchHealthData() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/health-data'));
      if (response.statusCode == 200) {
        return {
          "steps": "569",
          "calories": "1024",
          "heartRate": "72",
          "stress": "Relaxed",
        }; // Example data
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
