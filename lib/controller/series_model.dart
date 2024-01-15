import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teste/model/movies_model.dart';
import 'package:teste/model/series_model.dart';

class SeriesController {
  final ValueNotifier<List<SeriesModel>> state =
      ValueNotifier<List<SeriesModel>>([]);
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  Future<void> fetchData(String apiUrl, List<dynamic> model) async {
    isLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNmNkYTEyZWQ2M2U1YjFiZWM3NzFmNjJhOTE2ZDdkYyIsInN1YiI6IjY1OTM5MjcyY2U0ZGRjNmNkMzdmMjEzNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.wW5P6uNmVn7il9cW9wGzuINdeZte1dkeZ_4LE4maBBA',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final dynamic decodedResponse = jsonDecode(response.body);
        final List<dynamic> results = decodedResponse['results'];
        state.value =
            results.map((json) => SeriesModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data - ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error during API request: $error');
    } finally {
      isLoading.value = false;
    }
  }
}
