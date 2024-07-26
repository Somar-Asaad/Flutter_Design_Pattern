import 'dart:convert';

class Api1 {
  static String getYoutubePosts() {
    return '''
    [
      {
        "title":"First Video",
        "Description":"Description of the first video"
      },
      {
        "title":"second video",
        "Description":"Description of the second video"
      }
    ]
    ''';
  }
}

class Api2 {
  static String getMediumPosts() {
    return '''
    [
      {
        "title":"First post",
        "bio":"Description of the first post"
      },
      {
        "title":"second post",
        "bio":"Description of the second post"
      }
    ]
    ''';
  }
}

abstract class ApiAdapter {
  List<Post> getPosts();
}

class Api1Adapter implements ApiAdapter {
  String api = Api1.getYoutubePosts();

  @override
  List<Post> getPosts() {
    final List<dynamic> posts = jsonDecode(api) as List;
    return posts.map((e) {
      return Post(
        title: e['title'],
        bio: e['Description'],
      );
    }).toList();
  }
}

class Api2Adapter implements ApiAdapter {
  String api = Api2.getMediumPosts();

  @override
  List<Post> getPosts() {
    final List<dynamic> posts = jsonDecode(api) as List;
    return posts.map((e) {
      return Post(
        title: e['title'],
        bio: e['bio'],
      );
    }).toList();
  }
}

class FinalApiClass implements ApiAdapter {
  List<Post> api1 = Api1Adapter().getPosts();
  List<Post> api2 = Api2Adapter().getPosts();

  @override
  List<Post> getPosts() {
    return api1 + api2;
  }
}

class Post {
  String title;
  String bio;

  Post({
    required this.title,
    required this.bio,
  });
}
