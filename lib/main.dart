import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
              SliverAppBar(
                pinned: true,
                expandedHeight: 350,
                backgroundColor: const Color.fromRGBO(77, 175, 86, 1),
                leading: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back),
                  iconSize: 20,
                  color: Colors.black,
                ),
                actions: const [
                  Icon(
                    Icons.more_vert,
                    size: 40,
                    color: Colors.black,
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: DecoratedBox(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color.fromRGBO(
                              10, 10, 10, 1), // Darker shade close to black
                          Color.fromRGBO(
                              20, 20, 20, 1), // Darker shade close to black
                          Color.fromRGBO(30, 30, 30, 1),
                          Color.fromRGBO(
                              31, 131, 68, 1), // Darker shade of green
                          Color.fromRGBO(77, 175, 86, 1),
                          Color.fromRGBO(100, 201, 125, 1),
                        ],
                      ),
                    ),
                    child: Center(
                      child: SizedBox(
                        height: (MediaQuery.of(context).size.height) * 0.2,
                        child: Image.network(
                          'https://images.pexels.com/photos/794494/pexels-photo-794494.jpeg?cs=srgb&dl=pexels-anthony-%F0%9F%93%B7%F0%9F%93%B9%F0%9F%99%82-794494.jpg&fm=jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
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
