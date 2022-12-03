import 'package:flutter/material.dart';
import '../util/components.dart';
import 'main.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 64,
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
                    color: MyColors.primaryBlack,
                    border: Border.all(width: 1, color: MyColors.primaryGrey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Image(image: AssetImage('images/back.png')),
                ),
              ),
              const Spacer(),
            ],
          )),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  '#Category',
                  style: TextStyle(
                      color: MyColors.primaryBlack,
                      fontSize: 32,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                const SizedBox(height: 4),
                SizedBox(
                  height: 1000,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return const Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: ArticleTile(
                          date: '28th Sep',
                          image: 'images/articleImage.png',
                          time: '10:25am',
                          title:
                              'Feel the thrill on the only surf simulator in Maldives 2022',
                          category: 'Politics',
                        ),
                      );
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
