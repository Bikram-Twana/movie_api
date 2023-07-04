import 'package:api_demo/features/api_calling/application/api_service.dart';
import 'package:api_demo/features/api_calling/domain/post_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  List<PostModel> _posts = [];
  // PostModel? _post;

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  _fetchPosts() async {
    setState(() {
      _isLoading = true;
    });
    final posts = await APIService.getPosts();
    // final post = await APIService.getPostById(1);

    setState(() {
      _posts = posts;
      // _post = post;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Test"),
        actions: [
          IconButton(
              onPressed: () {
                _fetchPosts();
              },
              icon: const Icon(Icons.refresh)),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : (_posts.isEmpty)
              ? const Text("Failed to obtain data")
              : ListView.builder(
                  itemCount: _posts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_posts[index].title),
                      subtitle: Text(_posts[index].body),
                      leading: const Icon(Icons.account_circle),
                    );
                  }),
    );
  }
}
