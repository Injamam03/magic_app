import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LocationController extends GetxController {
  final suggestions = [].obs;
  final isLoading = false.obs;

  final Dio _dio = Dio();
  Timer? _debounce;

  String sessionToken = _generateSessionToken();
  final String _google_api_key = 'AIzaSyCG6jd6Hbe2BVKSxH069D-XG6fanIW7JVg';

  static String _generateSessionToken() {
    return Random().nextInt(1000000).toString();
  }

  void onChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 400), () {
      if (value.isNotEmpty) {
        fetchSuggestions(value);
      } else {
        suggestions.clear();
      }
    });
  }

  Future<void> fetchSuggestions(String input) async {
    try {
      isLoading.value = true;

      final response = await _dio.get(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json',
        queryParameters: {
          'input': input,
          'key': _google_api_key,
          'sessiontoken': sessionToken,
        },
      );

      suggestions.value = response.data['predictions'];
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<Map<String, dynamic>> getPlaceDetails(String placeId) async {
    final response = await _dio.get(
      'https://maps.googleapis.com/maps/api/place/details/json',
      queryParameters: {
        'place_id': placeId,
        'key': _google_api_key,
        'sessiontoken': sessionToken,
      },
    );

    final result = response.data['result'];

    // Reset session token after selection (important for billing)
    sessionToken = _generateSessionToken();

    return {
      'lat': result['geometry']['location']['lat'],
      'lng': result['geometry']['location']['lng'],
      'address': result['formatted_address'],
    };
  }
}
