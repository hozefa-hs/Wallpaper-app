class WallpaperModel {
  String? page;
  String? per_page;
  String? photos;
  String? url;
  String? src;
  String? original;
  String large2x;
  String? large;
  String? medium;
  String? small;
  String tiny;
  String? photographer;

  WallpaperModel(
      {this.page,
      this.per_page,
      this.photos,
      this.url,
      this.src,
      this.original,
      required this.large2x,
      this.large,
      this.medium,
      this.small,
      required this.tiny,
      this.photographer});
}
