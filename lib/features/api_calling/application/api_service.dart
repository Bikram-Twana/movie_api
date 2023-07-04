import 'dart:convert';
import 'dart:developer';

import 'package:api_demo/features/api_calling/domain/post_model.dart';
import 'package:dio/dio.dart';

class APIService {
  // Url of the API
  static const String apiUrl = "https://jsonplaceholder.typicode.com/posts/";
  static final dio = Dio();

  // Get all posts
  static Future<List<PostModel>> getPosts() async {
    try {
      final response = await dio.get(apiUrl);
      // log("response" + response.data);
      if (response.statusCode == 200) {
        // Without jsonEncode & jsonDecode
        List<PostModel> listPostModel = response.data
            .map<PostModel>((json) => PostModel.fromJson(json))
            .toList();
        // With jsonEncode & jsonDecode
        List<PostModel> listPostModel1 =
            postModelFromJson(jsonEncode(response.data));

        return listPostModel1;
      } else {
        throw Exception("Failed to load posts");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Get single post
  static Future<PostModel> getPostById(int id) async {
    try {
      final response = await dio.get("$apiUrl/$id");
      if (response.statusCode == 200) {
        PostModel postModel =
            singlePostModelFromJson(jsonEncode(response.data));
        return postModel;
      } else {
        throw Exception("Failes to load post");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
