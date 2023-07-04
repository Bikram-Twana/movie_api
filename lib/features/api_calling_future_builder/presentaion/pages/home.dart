import 'dart:developer';

import 'package:api_demo/features/api_calling/application/api_service.dart';
import 'package:api_demo/features/api_calling/domain/post_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future Builder Test"),
      ),
      body: FutureBuilder(
          future: APIService.getPosts(),
          builder: (context, snapshot) {
            // if (snapshot.connectionState == ConnectionState.waiting) {
            //   return const Center(child: CircularProgressIndicator());
            // }
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error} occur"),
                );
              } else if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      // final message = data1[index];
                      return ListTile(
                        title: Text(snapshot.data![index].title),
                        subtitle: Text(snapshot.data![index].body),
                        leading: const Icon(Icons.account_circle),
                      );
                    }));
              }
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
