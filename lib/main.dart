import 'package:design_patterns/adapter_design_pattern/adapter_design_pattern.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    List<Post> posts = FinalApiClass().getPosts();
    return MaterialApp(
      title: 'Flutter Design pattern',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    Post post = posts[index];
                    return ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.bio),
                    );
                  },
                  itemCount: posts.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
