import 'package:flutter/material.dart';
import 'package:news_app/screens/main.dart';

import '../util/article_content.dart';

class ReadArticle extends StatefulWidget {
  const ReadArticle({
    super.key,
  });

  @override
  State<ReadArticle> createState() => _ReadArticleState();
}

class _ReadArticleState extends State<ReadArticle> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              GestureDetector(
                //gesture detector
                onTap: () {
                  Navigator.pop(context);
                },

                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: MyColors.primaryWhite),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Image(image: AssetImage('images/back.png')),
                ),
              ),
              const Spacer(),
              GestureDetector(
                //gesture detector

                onTap: () {
                  final snackbar = SnackBar(
                    backgroundColor: MyColors.primaryBlack,
                    content: const Text('Saved to favorites'),
                    action: SnackBarAction(label: 'Okay', onPressed: () {}),
                  );
                  setState(() {
                    favorite = !favorite;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                },

                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: MyColors.primaryWhite),
                    borderRadius: BorderRadius.circular(20),
                    color: favorite ? Colors.redAccent : Colors.transparent,
                  ),
                  child: const Image(image: AssetImage('images/bookmark.png')),
                ),
              )
            ],
          )),

      //body
      body: Stack(
        children: [
          SizedBox(
            height: 2 * MediaQuery.of(context).size.height / 3,
            child: const Image(
                fit: BoxFit.cover,
                image: AssetImage('images/articleImage2.png')),
          ),
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.transparent,
                  Colors.white,
                ])),
          ),
          const ArticleContent(
            articleContent:
                "Just say anything, George, say what ever's natural, the first thing that comes to your mind. Take that you mutated son-of-a-bitch. My pine, why you. You space bastard, you killed a pine. You do? Yeah, it's 8:00. Hey, McFly, I thought I told you never. Just say anything, George, say what ever's natural, the first thing that comes to your mind. Take that you mutated son-of-a-bitch. My pine, why you. You space bastard, you killed a pine. You do? Yeah, it's 8:00. Hey, McFly, I thought I told you never. Just say anything, George, say what ever's natural, the first thing that comes to your mind. Take that you mutated son-of-a-bitch. My pine, why you. You space bastard, you killed a pine. You do? Yeah, it's 8:00. Hey, McFly, I thought I told you never. Just say anything, George, say what ever's natural, the first thing that comes to your mind. Take that you mutated son-of-a-bitch. My pine, why you. You space bastard, you killed a pine. You do? Yeah, it's 8:00. Hey, McFly, I thought I told you never",
            articleTitle: 'Unravel mystries of the Maldives',
          ),
        ],
      ),
    );
  }
}
