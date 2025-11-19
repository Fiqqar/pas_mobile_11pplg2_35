import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_35/colors/color_palette.dart';
import '../controllers/movie_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.find<MovieController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(color: ColorPalette.accentColor),
          );
        }

        final banner = controller.movieResponse.isNotEmpty
            ? controller.movieResponse[0]
            : null;

        return CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: 380,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: banner == null
                    ? Container(color: Colors.grey.shade900)
                    : Stack(
                        children: [
                          Positioned.fill(
                            child: Image.network(
                              controller.movieResponse[0].image.original,
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
                                    Color.fromRGBO(0, 0, 0, 0.1),
                                    Color.fromRGBO(0, 0, 0, 0.5),
                                    Color.fromRGBO(0, 0, 0, 0.95),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.only(left: 20, bottom: 40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  banner.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8),
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
                                          banner.rating.average.toString(),
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
                        ],
                      ),
              ),
            ),

            _section("Movie List", controller.movieResponse),
          ],
        );
      }),
    );
  }

  SliverToBoxAdapter _section(String title, List movies) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, bottom: 14),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),  
              ),
            ),
            Container(
              height: 250,
              margin: EdgeInsets.only(bottom: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 16, right: 16),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];

                  return Container(
                    width: 150,
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.grey.shade900.withAlpha(
                        (0.7 * 255).round(),
                      ),
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
                              movie.image.original,
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
                              movie.name,
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
                                ElevatedButton.icon(
                                  onPressed: () => controller.markFavorite(index),
                                  icon: Icon(Icons.bookmark_border),
                                  label: Text(''),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 6),
                                  child: Text(
                                    movie.rating.average.toString(),
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
            ),
          ],
        ),
      ),
    );
  }
}
