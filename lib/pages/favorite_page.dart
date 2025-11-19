import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_35/colors/color_palette.dart';
import 'package:pas_mobile_11pplg2_35/controllers/movie_controller.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});
  final controller = Get.find<MovieController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.movieMark.isEmpty) {
            return Center(
              child: Text(
                "No favorites movie found",
                style: TextStyle(
                  color: ColorPalette.accentColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              controller.getFavorite();
            },
            child: ListView.builder(
              itemCount: controller.movieMark.length,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final movie = controller.movieMark[index];

                final imageUrl = movie.image.original.isNotEmpty
                    ? movie.image.original
                    : movie.image.medium.isNotEmpty
                        ? movie.image.medium
                        : "https://via.placeholder.com/300x450?text=No+Image";

                final ratingText =
                    movie.rating.average?.toStringAsFixed(1) ?? "N/A";

                return Container(
                  height: 220,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.grey.shade900.withOpacity(0.7),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.yellow.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (c, e, s) => Container(
                            color: Colors.grey.shade800,
                            child: const Center(
                              child: Icon(Icons.broken_image,
                                  color: Colors.white54),
                            ),
                          ),
                        ),
                      ),

                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.8),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        left: 12,
                        right: 12,
                        bottom: 16,
                        child: Text(
                          movie.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),

                      Positioned(
                        left: 12,
                        top: 12,
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 18,
                              color: ColorPalette.accentColor,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              ratingText,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Positioned(
                        right: 12,
                        top: 12,
                        child: GestureDetector(
                          onTap: () {
                            controller.deleteFavorite(index);
                          },
                          child: Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.55),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.delete,
                              color: ColorPalette.accentColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
