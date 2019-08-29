import 'package:flutter/material.dart';
import 'movie_card.dart';
import 'movie_tile.dart';
import 'httpRequest.dart';
import 'movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  MovieListState createState() => MovieListState();
}

class MovieListState extends State<MovieList> {

  double _crossAxisSpacing = 8, _mainAxisSpacing = 12, _aspectRatio = 1/2;
  int _crossAxisCount = 2;

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
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _crossAxisCount,
            crossAxisSpacing: _crossAxisSpacing,
            mainAxisSpacing: _mainAxisSpacing,
            childAspectRatio: _aspectRatio,
          ),
            itemCount: movies == null ? 0 : movies.length,
            itemBuilder: (context, i) {
              return new FlatButton(
                child: MovieCard(movies, i),
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                        return new MovieDetail(movies[i]);
                      }));
                },
              );
            }
        )
  );

/*@override
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
      );*/
}
