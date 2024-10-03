
// To parse this JSON data, do
//
//     final getApi = getApiFromJson(jsonString);

import 'dart:convert';

List<GetApi> getApiFromJson(String str) => List<GetApi>.from(json.decode(str).map((x) => GetApi.fromJson(x)));

String getApiToJson(List<GetApi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetApi {
  int id;
  String title;
  String content;
  String slug;
  String picture;
  String user;
  Links links;

  GetApi({
    required this.id,
    required this.title,
    required this.content,
    required this.slug,
    required this.picture,
    required this.user,
    required this.links,
  });

  factory GetApi.fromJson(Map<String, dynamic> json) => GetApi(
    id: json["id"],
    title: json["title"],
    content: json["content"],
    slug: json["slug"],
    picture: json["picture"],
    user: json["user"],
    links: Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "content": content,
    "slug": slug,
    "picture": picture,
    "user": user,
    "_links": links.toJson(),
  };
}

class Links {
  Delete self;
  Delete modify;
  Delete delete;

  Links({
    required this.self,
    required this.modify,
    required this.delete,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: Delete.fromJson(json["self"]),
    modify: Delete.fromJson(json["modify"]),
    delete: Delete.fromJson(json["delete"]),
  );

  Map<String, dynamic> toJson() => {
    "self": self.toJson(),
    "modify": modify.toJson(),
    "delete": delete.toJson(),
  };
}

class Delete {
  String href;

  Delete({
    required this.href,
  });

  factory Delete.fromJson(Map<String, dynamic> json) => Delete(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}
