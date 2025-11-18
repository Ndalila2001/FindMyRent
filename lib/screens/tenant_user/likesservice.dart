// ignore_for_file: unused_import

import 'package:flutter/material.dart';

class LikesService {
  // store liked places globally
  static List<Map<String, String>> likedPlaces = [];

  static void toggleLike(Map<String, String> place) {
    if (likedPlaces.any((p) => p["id"] == place["id"])) {
      likedPlaces.removeWhere((p) => p["id"] == place["id"]);
    } else {
      likedPlaces.add(place);
    }
  }

  static bool isLiked(String id) {
    return likedPlaces.any((p) => p["id"] == id);
  }
}
