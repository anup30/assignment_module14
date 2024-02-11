class Pictures {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Pictures({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  Pictures.fromJson(dynamic i)
      : albumId = i["albumId"],
        id = i["id"],
        title = i["title"],
        url = i["url"],
        thumbnailUrl = i["thumbnailUrl"];
}
