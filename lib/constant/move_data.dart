///
/// Created by NieBin on 18-12-8
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
///
import 'package:meta/meta.dart';
//import "package:flutter/material.dart";

class MoveItem {
  int id;
  String name;
  String category;
  String releaseDate;
  String releaseDateDesc;
  String directors;
  String runtime;
  String desc;
  double rating;
  String imageUrl;
  String bannerUrl;
  String trailerImg1;
  String trailerImg2;
  String trailerImg3;

  MoveItem({
    @required this.id,
    @required this.name,
    @required this.category,
    @required this.directors,
    @required this.releaseDate,
    @required this.releaseDateDesc,
    @required this.runtime,
    @required this.desc,
    @required this.rating,
    @required this.imageUrl,
    @required this.bannerUrl,
    @required this.trailerImg1,
    @required this.trailerImg2,
    @required this.trailerImg3,
  });
}

List<MoveItem> getItemList() {
  return [
    MoveItem(
      id: 0,
      name: 'Avengers: Infinity War',
      category: 'Action, Adventure, Fantasy',
      desc: 'The Avengers and their allies must be willing '
          'to sacrifice all in an attempt to defeat '
          'the powerful Thanos before his blitz of '
          'devastation and ruin puts an end to the universe.'
          '\nAs the Avengers and their allies have continued '
          'to protect the world from threats too large for '
          'any one hero to handle, a danger has emerged '
          'from the cosmic shadows: Thanos.',
      rating: 8.7,
      directors: 'Directors: Anthony Russo, Joe Russo',
      releaseDate: '27 April 2018',
      releaseDateDesc: 'USA (2018), 2h 29min',
      runtime: '2h 29min',
      bannerUrl: 'assets/moves/movie_banner_1.png',
      imageUrl: 'assets/moves/ic_preview_1.png',
      trailerImg1: 'assets/moves/ic_thumb_11.png',
      trailerImg2: 'assets/moves/ic_thumb_12.png',
      trailerImg3: 'assets/moves/ic_thumb_13.png',
    ),
    MoveItem(
      id: 1,
      name: 'Transformers: The Last Knight',
      category: 'Action, Adventure, Sci-Fi',
      desc: 'Autobots and Decepticons are at war, with humans '
          'on the sidelines. Optimus Prime is gone. The key to '
          'saving our future lies buried in the secrets of the past, '
          'in the hidden history of Transformers on Earth.',
      rating: 5.2,
      directors: 'Directors: Michael Bay',
      releaseDate: '21 June 2017',
      releaseDateDesc: 'USA (2017), 2h 34min',
      runtime: '2h 34min',
      bannerUrl: 'assets/moves/movie_banner_2.png',
      imageUrl: 'assets/moves/ic_preview_2.png',
      trailerImg1: 'assets/moves/ic_thumb_21.png',
      trailerImg2: 'assets/moves/ic_thumb_21.png',
      trailerImg3: 'assets/moves/ic_thumb_21.png',
    ),
    MoveItem(
      id: 2,
      name: 'Pacific Rim: Uprising',
      category: 'Action, Adventure, Sci-Fi',
      desc: 'Jake Pentecost, son of Stacker Pentecost, reunites with '
          'Mako Mori to lead a new generation of Jaeger pilots, including '
          'rival Lambert and 15-year-old hacker Amara, against a new Kaiju threat.',
      rating: 5.7,
      directors: 'Directors: Steven S. DeKnight',
      releaseDate: '23 March 2018',
      releaseDateDesc: 'USA (2018), 1h 51min',
      runtime: '1h 51min',
      bannerUrl: 'assets/moves/movie_banner_3.png',
      imageUrl: 'assets/moves/ic_preview_3.png',
      trailerImg1: 'assets/moves/ic_thumb_31.png',
      trailerImg2: 'assets/moves/ic_thumb_31.png',
      trailerImg3: 'assets/moves/ic_thumb_31.png',
    ),
    MoveItem(
      id: 3,
      name: 'Thor: Ragnarok',
      category: 'Action, Adventure, Comedy',
      desc: 'Thor is imprisoned on the planet Sakaar, and must '
          'race against time to return to Asgard and stop Ragnarök, '
          'the destruction of his world, at the hands of the powerful '
          'and ruthless villain Hela.',
      rating: 7.9,
      directors: 'Directors: Taika Waititi',
      releaseDate: '3 November 2017',
      releaseDateDesc: 'USA (2017), 2h 10min',
      runtime: '2h 10min',
      bannerUrl: 'assets/moves/movie_banner_4.png',
      imageUrl: 'assets/moves/ic_preview_4.png',
      trailerImg1: 'assets/moves/ic_thumb_41.png',
      trailerImg2: 'assets/moves/ic_thumb_41.png',
      trailerImg3: 'assets/moves/ic_thumb_41.png',
    ),
    MoveItem(
      id: 4,
      name: 'Thor: Ragnarok',
      category: 'Action, Adventure, Comedy',
      desc: 'Thor is imprisoned on the planet Sakaar, and must '
          'race against time to return to Asgard and stop Ragnarök, '
          'the destruction of his world, at the hands of the powerful '
          'and ruthless villain Hela.',
      rating: 7.9,
      directors: 'Directors: Taika Waititi',
      releaseDate: '3 November 2017',
      releaseDateDesc: 'USA (2017), 2h 10min',
      runtime: '2h 10min',
      bannerUrl: 'assets/moves/movie_banner_4.png',
      imageUrl: 'assets/moves/ic_preview_4.png',
      trailerImg1: 'assets/moves/ic_thumb_41.png',
      trailerImg2: 'assets/moves/ic_thumb_41.png',
      trailerImg3: 'assets/moves/ic_thumb_41.png',
    ),
    MoveItem(
      id: 5,
      name: 'Thor: Ragnarok',
      category: 'Action, Adventure, Comedy',
      desc: 'Thor is imprisoned on the planet Sakaar, and must '
          'race against time to return to Asgard and stop Ragnarök, '
          'the destruction of his world, at the hands of the powerful '
          'and ruthless villain Hela.',
      rating: 7.9,
      directors: 'Directors: Taika Waititi',
      releaseDate: '3 November 2017',
      releaseDateDesc: 'USA (2017), 2h 10min',
      runtime: '2h 10min',
      bannerUrl: 'assets/moves/movie_banner_4.png',
      imageUrl: 'assets/moves/ic_preview_4.png',
      trailerImg1: 'assets/moves/ic_thumb_41.png',
      trailerImg2: 'assets/moves/ic_thumb_41.png',
      trailerImg3: 'assets/moves/ic_thumb_41.png',
    ),
    MoveItem(
      id: 6,
      name: 'Thor: Ragnarok',
      category: 'Action, Adventure, Comedy',
      desc: 'Thor is imprisoned on the planet Sakaar, and must '
          'race against time to return to Asgard and stop Ragnarök, '
          'the destruction of his world, at the hands of the powerful '
          'and ruthless villain Hela.',
      rating: 7.9,
      directors: 'Directors: Taika Waititi',
      releaseDate: '3 November 2017',
      releaseDateDesc: 'USA (2017), 2h 10min',
      runtime: '2h 10min',
      bannerUrl: 'assets/moves/movie_banner_4.png',
      imageUrl: 'assets/moves/ic_preview_4.png',
      trailerImg1: 'assets/moves/ic_thumb_41.png',
      trailerImg2: 'assets/moves/ic_thumb_41.png',
      trailerImg3: 'assets/moves/ic_thumb_41.png',
    ),
  ];
}
