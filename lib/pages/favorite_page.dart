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
              itemBuilder: (context, index) {
                final product = controller.movieMark[index];

                return Container(
                  width: 150,
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.grey.shade900.withAlpha((0.7 * 255).round()),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(255, 255, 0, 0.1),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.network(
                            product.image.original,
                            fit: BoxFit.cover,
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
                                  Color.fromRGBO(0, 0, 0, 0.8),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          margin: EdgeInsets.only(
                            bottom: 16,
                            left: 12,
                            right: 12,
                          ),
                          child: Text(
                            product.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          margin: EdgeInsets.only(top: 16, left: 12),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 18,
                                color: ColorPalette.accentColor,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 6),
                                child: Text(
                                  product.rating.average.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
