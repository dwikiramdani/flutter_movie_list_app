import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  final movies;

  final i;

  final imageUrl = 'https://image.tmdb.org/t/p/w500/';

  MovieTile(this.movies, this.i);

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          ListTile(
            leading: Container(
              child: Image.network(imageUrl + movies[i]['poster_path']),
              width: 64,
              height: 128,
            ),
            title: Container(
              child: Text(
                movies[i]['title'],
                style: new TextStyle(
                    color: Colors.black, fontSize: 16.0, fontFamily: 'Lato'),
              ),
            ),
            subtitle: Container(
                child: Text(
              'Release Date ' + '${movies[i]['release_date']}',
              style: new TextStyle(
                  color: Colors.black, fontSize: 12.0, fontFamily: 'Lato'),
            )),
            trailing: Container(
                child: Text(
              '${movies[i]['vote_average']}' + '/10',
              style: new TextStyle(
                  color: Colors.black, fontSize: 16.0, fontFamily: 'Lato'),
            )),
            /*onTap: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => DetailMovie(movie:_movie)
          ));
        },*/
          ),
          Divider()
        ],
      );
}
