import 'package:flutter/material.dart';

class CustomeSliverAppbar extends StatefulWidget {
  const CustomeSliverAppbar({Key? key}) : super(key: key);

  @override
  State<CustomeSliverAppbar> createState() => _CustomeSliverAppbarState();
}

class _CustomeSliverAppbarState extends State<CustomeSliverAppbar> {
  double imageHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 345,
              centerTitle: false,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double percentage =
                      (constraints.maxHeight - kToolbarHeight) / 260;
                  percentage = percentage.clamp(0.0, 1.0);

                  imageHeight = 260 * (percentage);
                  imageHeight = imageHeight.clamp(0.0, 210.0);
                  List<Color> appbarColors = const [
                    Color.fromARGB(255, 1, 39, 15),
                    Color.fromARGB(255, 4, 84, 40),
                    Color.fromARGB(255, 3, 93, 43),
                  ];
                  if (imageHeight < 10) {
                    appbarColors = const [
                      Color.fromARGB(255, 3, 37, 17),
                      Color.fromARGB(255, 1, 39, 15),
                    ];
                  }

                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: appbarColors,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (percentage == 1)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 17.0, horizontal: 25),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      color: Colors.white.withOpacity(0.12),
                                      width: 295,
                                      child: const Padding(
                                        padding: EdgeInsets.all(7.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.search,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Find in playlist.",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Container(
                                      color: Colors.white.withOpacity(0.12),
                                      width: 65,
                                      child: const Padding(
                                        padding: EdgeInsets.all(9.8),
                                        child: Center(
                                            child: Text(
                                          "Filters",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (imageHeight > 70)
                              AnimatedOpacity(
                                opacity: percentage,
                                duration: const Duration(milliseconds: 100),
                                child: Container(
                                  height: imageHeight,
                                  width: 470 * percentage * 0.53,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                                255, 31, 55, 41)
                                            .withOpacity(0.5),
                                        spreadRadius: 4,
                                        blurRadius: 15,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Image.network(
                                    'https://images.pexels.com/photos/794494/pexels-photo-794494.jpeg?cs=srgb&dl=pexels-anthony-%F0%9F%93%B7%F0%9F%93%B9%F0%9F%99%82-794494.jpg&fm=jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            if (imageHeight < 40)
                              const AnimatedOpacity(
                                opacity: 1.0,
                                duration: Duration(milliseconds: 300),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 78.0),
                                    child: Text(
                                      'Appbar',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 8,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 1, 39, 15),
                      Colors.black,
                      Colors.black,
                      Colors.black,
                      Colors.black,
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
                      child: Text(
                        "Justin Biber, One Direction and more.",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.0, horizontal: 18),
                      child: Text(
                        "Made by Pratik Lama",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.0, horizontal: 18),
                      child: Text(
                        "2h 48min",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12.0, horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.download_rounded,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...List.generate(
                      20,
                      (index) => ListTile(
                        textColor: Colors.white,
                        title: Text('Item $index'),
                      ),
                    )
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
