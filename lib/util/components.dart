import 'package:flutter/material.dart';
import 'package:news_app/screens/read_article.dart';
import 'package:news_app/util/typography.dart';

import '../screens/main.dart';

//chip
class CategoryChip extends StatelessWidget {
  const CategoryChip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Chip(
          backgroundColor: MyColors.primaryWhite,
          side: BorderSide(color: MyColors.primaryBlue),
          label: Text(
            '#Category',
            style: TextStyle(color: MyColors.primaryBlue),
          )),
    );
  }
}

//featured article
class FeaturedArticle extends StatelessWidget {
  final String title;
  final String authorName;
  final String date;
  final String image;
  final String authorImage;
  const FeaturedArticle({
    Key? key,
    required this.title,
    required this.authorName,
    required this.date,
    required this.image,
    required this.authorImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //gesture detector
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ReadArticle(),
            ));
      },

      //design
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: MyColors.primaryBlack.withOpacity(0.051),
                offset: const Offset(0, 3),
                blurRadius: 25,
              ),
            ],
            color: MyColors.primaryWhite,
          ),
          width: 255,
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Image(image: AssetImage(image)),
              const SizedBox(
                height: 20,
              ),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: MyColors.primaryBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.5),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Image(
                    height: 32,
                    width: 32,
                    image: AssetImage(authorImage),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(authorName),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        date,
                        style: subText(),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        color: MyColors.bgBlue,
                        borderRadius: BorderRadius.circular(16)),
                    width: 40,
                    child: const Image(image: AssetImage('images/open.png')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArticleTile extends StatelessWidget {
  final String title;
  final String time;
  final String date;
  final String image;
  final String category;
  const ArticleTile({
    Key? key,
    required this.title,
    required this.time,
    required this.date,
    required this.image,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Image(
            image: AssetImage(image),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Category: $category',
                style: subText(),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: 260,
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: MyColors.primaryBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      const Image(image: AssetImage('images/calendar.png')),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        date,
                        style: subText(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  Row(
                    children: [
                      const Image(image: AssetImage('images/clock.png')),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        time,
                        style: subText(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
