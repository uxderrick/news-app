import 'package:flutter/material.dart';

import '../screens/main.dart';
import 'article_details.dart';

class ArticleContent extends StatelessWidget {
  final String articleTitle;
  final String articleContent;
  const ArticleContent({
    Key? key,
    required this.articleTitle,
    required this.articleContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 400,
          ),
          SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(minHeight: 500),
              width: double.infinity,
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
              decoration: BoxDecoration(
                  color: MyColors.primaryWhite,
                  borderRadius: BorderRadius.circular(32)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //article title
                  Text(
                    articleTitle,
                    style: const TextStyle(
                        fontSize: 36, fontWeight: FontWeight.w500, height: 1.2),
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  //article details
                  const ArticleDetails(
                    articleDate: 'May 17',
                    authorImage: 'images/Vector.png',
                    readDuration: '8',
                    authorName: 'Keanu Carpent',
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  //article content
                  Text(
                    articleContent,
                    style: TextStyle(fontSize: 18, height: 1.8),
                  ),

                  const SizedBox(
                    height: 80,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
