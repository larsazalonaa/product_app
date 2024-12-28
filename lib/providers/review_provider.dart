import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ReviewProvider with ChangeNotifier {
  List<dynamic> reviews = [];
  bool isLoading = true;

  // Fetch reviews from API
  Future<void> fetchReviews(String productId) async {
    try {
      final response = await http.get(Uri.parse(
          'http://192.168.100.166:3004/products/$productId/reviews'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data is Map<String, dynamic> && data['data'] is List) {
          reviews = data['data'];
          isLoading = false;
          notifyListeners(); // Memberitahu widget untuk rebuild
        } else {
          throw Exception("Format respons tidak sesuai");
        }
      } else {
        throw Exception("Gagal memuat review");
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      throw Exception("Gagal memuat review: $e");
    }
  }
}
