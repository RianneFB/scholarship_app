import 'dart:convert';
import 'package:http/http.dart' as http;

class Scholarship {
  final String id;
  final String name;
  final String description;
  final String amount;
  final String deadline;
  final String category;
  final String applicationUrl;
  final String organization;
  final String country;

  const Scholarship({
    required this.id,
    required this.name,
    required this.description,
    required this.amount,
    required this.deadline,
    required this.category,
    required this.applicationUrl,
    required this.organization,
    required this.country,
  });

  factory Scholarship.fromJson(Map<String, dynamic> json) {
    return Scholarship(
      id: (json['id'] ?? '').toString(),
      name: (json['name'] ??
              json['title'] ??
              'Unnamed Scholarship')
          .toString(),
      description: (json['description'] ?? '').toString(),
      amount: (json['amount'] ??
              json['award_amount'] ??
              json['value'] ??
              'Not specified')
          .toString(),
      deadline: (json['deadline'] ??
              json['application_deadline'] ??
              'Not specified')
          .toString(),
      category: (json['category'] ?? 'General').toString(),
      applicationUrl: (json['application_url'] ??
              json['application_link'] ??
              json['url'] ??
              '')
          .toString(),
      organization: (json['organization'] ??
              json['provider'] ??
              json['university'] ??
              'Not specified')
          .toString(),
      country: (json['country'] ?? 'Canada').toString(),
    );
  }
}

class ApiService {
  static const String baseUrl = 
      'https://scholarship-api.onrender.com/api/scholarships';
  
  Future<List<Scholarship>> fetchScholarships() async {
    final response = await http
        .get(
          Uri.parse(baseUrl),
          headers: {
            'Accept': 'application/json',
            'x-api-key': 'wn_live_f0c6f42bb583e3a536014642659efd4c',
          },
        )
        .timeout(const Duration(seconds: 20));

    if (response.statusCode != 200) {
      throw Exception(
          'Failed to load scholarships: ${response.statusCode}'
      );
    }

    final decoded = jsonDecode(response.body);

    dynamic data = decoded;

    if (decoded is Map<String, dynamic>) {
      data = decoded['data'] ??
          decoded['scholarships'] ??
          decoded['results'] ??
          decoded['items'];
    }

    if (data is! List) {
      throw Exception(
        'Unexpected response format from API.',
      );
    }

    return data
        .whereType<Map<String, dynamic>>()
        .map((item) => Scholarship.fromJson(item))
        .toList();
  }
}