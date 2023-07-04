import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Silver App Bar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ListTile(
                      textColor: Colors.white,
                      title: Text('Item $index'),
                    );
                  },
                  childCount: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    const double maxExtent = 350.0;
    const double minExtent = 0.0;
    final double offset = shrinkOffset.clamp(minExtent, maxExtent);
    final double percentage = 1.0 - (offset / maxExtent);

    return SizedBox(
      height: maxExtent - offset,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromRGBO(0, 0, 0, 1),
                  Color.fromRGBO(35, 55, 46, 1),
                  Color.fromRGBO(31, 131, 68, 1),
                  Color.fromRGBO(77, 175, 86, 1),
                  Color.fromRGBO(100, 201, 125, 1),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 190 * percentage,
                width: 170 * percentage,
                child: Image.network(
                  'https://images.pexels.com/photos/794494/pexels-photo-794494.jpeg?cs=srgb&dl=pexels-anthony-%F0%9F%93%B7%F0%9F%93%B9%F0%9F%99%82-794494.jpg&fm=jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ],
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
      ),
    );
  }

  @override
  double get maxExtent => 350.0;

  @override
  double get minExtent => 0.0;

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) => true;
}
