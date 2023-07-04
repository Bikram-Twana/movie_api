import 'package:api_demo/features/movie_api/presentation/controllers/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieHomePage extends StatelessWidget {
  const MovieHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Home Page'),
      ),
      body: FutureBuilder(
          future: movieProvider.getAllResults(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.amber,
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].question!),
                        subtitle: Text(snapshot.data![index].correctAnswer!),
                      );
                    }));
              }
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
