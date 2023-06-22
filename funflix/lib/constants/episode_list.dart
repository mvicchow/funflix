

import 'package:flutter/material.dart';
import 'package:funflix/widgets/episode.dart';

List episodeList = [
  Container(
    width: double.infinity,
    child: Image.asset('assets/movie1-preview.png', fit: BoxFit.fitWidth,)
  ),
  SizedBox(child: Text('Spongebob squarepants', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)),
  SizedBox(child: Text('')),
  Episode(
    episodeThumbnail: 'assets/movie1-episode1.png',
    episodeTitle: "1. Episode 1",
  ),
  Episode(
    episodeThumbnail: 'assets/movie1-episode2.png',
    episodeTitle: "2. Episode 2",
  ),
  Episode(
    episodeThumbnail: 'assets/movie1-episode1.png',
    episodeTitle: "3. Episode 3",
  ),
  Episode(
    episodeThumbnail: 'assets/movie1-episode1.png',
    episodeTitle: "4. Episode 4",
  ),
  Episode(
    episodeThumbnail: 'assets/movie1-episode1.png',
    episodeTitle: "5. Episode 5",
  ),
];
