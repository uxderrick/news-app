import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/util/typography.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../util/components.dart';
import 'main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgWhite,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        foregroundColor: MyColors.primaryBlack,
        backgroundColor: MyColors.bgWhite,
        title: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            const Image(image: AssetImage('images/Vector.png')),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome back',
                  style: TextStyle(
                    color: MyColors.primaryBlack,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Monday, 3 October',
                  style: subText(),
                ),
              ],
            ),
          ],
        ),
      ),

      //body
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: const WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text(
                "pull up load",
                style: highlightText(),
              );
            } else if (mode == LoadStatus.loading) {
              body = const CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = const Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = const Text("Release to load more");
            } else {
              body = Text(
                "No more Data",
                style: highlightText(),
              );
            }
            return SizedBox(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(left: 16),
                        color: MyColors.bgBlue,
                        height: 56,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Search for an article',
                              hintStyle: TextStyle(
                                  color: MyColors.primaryGrey.withOpacity(0.5)),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: Container(
                                decoration: BoxDecoration(
                                    color: MyColors.primaryBlue,
                                    borderRadius: BorderRadius.circular(16)),
                                width: 56,
                                child: const Image(
                                    image: AssetImage('images/search.png')),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //categories
              SizedBox(
                height: 80,
                child: ListView.builder(
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return const CategoryChip();
                  },
                ),
              ),

              const SizedBox(height: 16),

              //other body

              //featured articles
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Featured articles',
                  style: TextStyle(
                      color: MyColors.primaryBlack,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 4),
              SizedBox(
                height: 320,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return const Padding(
                      padding: EdgeInsets.only(right: 0),
                      child: FeaturedArticle(
                        authorName: 'Sang Dong-Min',
                        date: 'Sep 9, 2022',
                        image: 'images/bg image.png',
                        title:
                            'Feel the thrill on the only surf simulator in Maldives 2022',
                        authorImage: 'images/Vector.png',
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),

              //More articles
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'More articles',
                        style: TextStyle(
                            color: MyColors.primaryBlack,
                            fontSize: 20,
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
                                category: 'Politics',
                                date: '28th Sep',
                                image: 'images/articleImage.png',
                                time: '10:25am',
                                title:
                                    'Feel the thrill on the only surf simulator in Maldives 2022',
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
