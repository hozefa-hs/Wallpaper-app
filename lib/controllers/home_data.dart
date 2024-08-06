import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/models/home_model.dart';

class Wallpaper {
  List<WallpaperModel> wallpaperImages = [];

  Future<void> getWallpaper() async {
    String url = 'https://api.pexels.com/v1/curated?per_page=80';
    var response = await http.get(Uri.parse(url), headers: {
      'Authorization':
          'SuEcSgwwWgQu2Ri7c1OR2gEX3EVJEVv1zL8XAL1LrtnlR5IPnBa1DHwv'
    });

    var jsonData = jsonDecode(response.body);
    print(jsonData);

    jsonData['photos'].forEach((element) {
      WallpaperModel wallpaperModel = WallpaperModel(
        photographer: element["photographer"],
        tiny: element["src"]["portrait"],
        large2x: element["src"]["large2x"],
      );
      wallpaperImages.add(wallpaperModel);
    });
  }
}
