// To parse this JSON data, do
//
//     final articlesModel = articlesModelFromJson(jsonString);

import 'dart:convert';

ArticlesModel articlesModelFromJson(String str) => ArticlesModel.fromJson(json.decode(str));

String articlesModelToJson(ArticlesModel data) => json.encode(data.toJson());

class ArticlesModel {
  ArticlesModel({
    this.success,
    this.articles,
  });

  bool success;
  List<Article> articles;

  factory ArticlesModel.fromJson(Map<String, dynamic> json) => ArticlesModel(
    success: json["success"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}

class Article {
  Article({
    this.id,
    this.name,
    this.imagePath,
    this.comment,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String imagePath;
  String comment;
  DateTime createdAt;
  DateTime updatedAt;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    id: json["id"],
    name: json["name"],
    imagePath: json["image_path"],
    comment: json["comment"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image_path": imagePath,
    "comment": comment,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
