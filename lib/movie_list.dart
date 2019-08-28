import 'package:flutter/material.dart';
import 'package:my_app/movie_tile.dart';
import 'httpRequest.dart';
import 'movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  MovieListState createState() => MovieListState();
}

class MovieListState extends State<MovieList> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  var movies;

  void getData() async {
    final data = await getMovie();
    setState(() {
      movies = data['results'];
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Popular Movie'),
        ),
        body: ListView.builder(
            itemCount: movies == null ? 0 : movies.length,
            itemBuilder: (context, i) {
              return new FlatButton(
                child: MovieTile(movies, i),
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return new MovieDetail(movies[i]);
                  }));
                },
              );
            }),
      );
}
