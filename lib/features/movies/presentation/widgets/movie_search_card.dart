import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_arch_movie_app/core/presentation/widgets/custom_rating_indicator.dart';
import 'package:clean_arch_movie_app/features/movies/domain/entities/movie.dart';
import 'package:clean_arch_movie_app/features/movies/presentation/pages/movie_details.dart';
import 'package:flutter/material.dart';

class MovieSearchCard extends StatelessWidget {
  const MovieSearchCard({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        MovieDetails.route,
        arguments: movie,
      ),
      child: SizedBox(
        height: 180,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    imageUrl: movie.poster,
                    width: 120,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  Text(
                    movie.overview,
                    maxLines: 5,
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: CustomRatingIndicator(rating: movie.ratingOutFive, size: 20),
                  )
                ],
              ))
            ]),
          ),
        ),
      ),
    );
  }
}
