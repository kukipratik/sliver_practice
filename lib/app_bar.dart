import 'package:flutter/material.dart';

class SliverSliver extends StatefulWidget {
  const SliverSliver({super.key});

  @override
  State<SliverSliver> createState() => _SliverSliverState();
}

class _SliverSliverState extends State<SliverSliver> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 300,
              backgroundColor: const Color.fromRGBO(77, 175, 86, 1),
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double percentage =
                      (constraints.maxHeight - kToolbarHeight) / 200;
                  percentage = percentage.clamp(0.0, 1.0);

                  double imageHeight = 190 * (percentage);
                  imageHeight = imageHeight.clamp(0.0, 190.0);

                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Color.fromRGBO(33, 65, 50, 1),
                              Color.fromRGBO(28, 118, 61, 1),
                              Color.fromRGBO(31, 131, 68, 1),
                              Color.fromRGBO(77, 175, 86, 1),
                            ],
                            stops: [0.0, 0.33, 0.66, 1.0],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Container(
                            //   height: 50,
                            //   width: 300,
                            //   color: Colors.red,
                            // ),
                            if (imageHeight > 50)
                              SizedBox(
                                height: imageHeight,
                                width: 170 * percentage,
                                child: Image.network(
                                  'https://images.pexels.com/photos/794494/pexels-photo-794494.jpeg?cs=srgb&dl=pexels-anthony-%F0%9F%93%B7%F0%9F%93%B9%F0%9F%99%82-794494.jpg&fm=jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            if (imageHeight == 0)
                              const Text(
                                'Appbar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
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
                      Color.fromRGBO(34, 61, 48, 1),
                      Color.fromARGB(255, 16, 34, 25),
                      Color.fromARGB(255, 0, 0, 0),
                      Color.fromARGB(255, 0, 0, 0),
                      Color.fromARGB(255, 10, 20, 15),
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
