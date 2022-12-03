import 'package:flutter/material.dart';
import 'package:news_app/util/typography.dart';

import '../screens/main.dart';

class ArticleDetails extends StatelessWidget {
  final String authorImage;
  final String authorName;
  final String articleDate;
  final String readDuration;
  const ArticleDetails({
    Key? key,
    required this.authorImage,
    required this.authorName,
    required this.articleDate,
    required this.readDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 56,
      decoration: BoxDecoration(
          border: Border.all(color: MyColors.primaryGrey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(authorImage),
            backgroundColor: Colors.amber,
          ),
          const SizedBox(
            width: 8,
          ),
          Row(
            children: [
              Text(
                authorName,
                style: subText(),
              ),
              const SizedBox(
                width: 8,
              ),
              CircleAvatar(
                radius: 3,
                backgroundColor: MyColors.primaryGrey.withOpacity(0.5),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                articleDate,
                style: subText(),
              ),
              const SizedBox(
                width: 8,
              ),
              CircleAvatar(
                radius: 3,
                backgroundColor: MyColors.primaryGrey.withOpacity(0.5),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                '$readDuration min read',
                style: subText(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
