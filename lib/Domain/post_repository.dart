import 'dart:convert';
import 'package:post_bloc/Configuration/api_constants.dart';
import 'package:post_bloc/Data/DataProvider/network_data_provider.dart';
import 'package:post_bloc/Data/Model/post_model.dart';

class PostRepository {
  late NetworkDataProvider networkProvider;

  PostRepository._() {
    networkProvider = NetworkDataProvider.instance;
  }

  static final instance = PostRepository._();

  Future<List<Post>> getAllPost() async {
    List<Post> list = [];
    String? response = await networkProvider.GET(ApiConstants.baseUrl, ApiConstants.apiPost);

    if(response != null) {
      List json = jsonDecode(response);
      list = json.map((element) => Post.fromJson(element)).toList();
    }

    return list;
  }

  Future<String?> updatePost(Post post) async {
    String? response = await networkProvider.PUT(ApiConstants.baseUrl, ApiConstants.apiPost, post.toJson());
    return response;
  }

  Future<String?> deletePost(id) async{
    String? response = await networkProvider.DELETE(ApiConstants.baseUrl, ApiConstants.apiDelete + id.toString());
    return response;
  }


}