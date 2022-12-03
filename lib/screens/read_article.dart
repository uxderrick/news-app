import 'package:flutter/material.dart';
import 'package:news_app/screens/main.dart';

class ReadArticle extends StatefulWidget {
  const ReadArticle({super.key});

  @override
  State<ReadArticle> createState() => _ReadArticleState();
}

class _ReadArticleState extends State<ReadArticle> {
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
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: MyColors.primaryWhite),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Image(image: AssetImage('images/bookmark.png')),
              )
            ],
          )),

      //body
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            color: Colors.amber,
          ),
          Column(
            children: [
              const Spacer(),
              Container(
                height: 3 * MediaQuery.of(context).size.height / 5,
                decoration: BoxDecoration(
                    color: MyColors.primaryWhite,
                    borderRadius: BorderRadius.circular(32)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
