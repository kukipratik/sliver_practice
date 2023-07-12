import 'package:flutter/material.dart';
import 'package:sliver_practice/search_container.dart';

class SliverSearchPage extends StatefulWidget {
  const SliverSearchPage({Key? key}) : super(key: key);

  @override
  State<SliverSearchPage> createState() => _SliverSearchPageState();
}

class _SliverSearchPageState extends State<SliverSearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              toolbarHeight: 80,
              backgroundColor: Colors.black,
              pinned: true,
              expandedHeight: 145,
              centerTitle: false,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double percentage =
                      (constraints.maxHeight - kToolbarHeight) / 80;
                  percentage = percentage.clamp(0.0, 1.0);

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (percentage == 1)
                        const Padding(
                          padding: EdgeInsets.only(left: 18.0, bottom: 20),
                          child: Text(
                            "Search",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchContainer()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 11.5, left: 18, right: 18),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4.0)),
                            width: double.infinity,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 8),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Artists, songs, or podcasts",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        "Browse all",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 1.5,
                      ),
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return GridTile(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4.0)),
                            child: Center(
                              child: Text(
                                'Item $index',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
