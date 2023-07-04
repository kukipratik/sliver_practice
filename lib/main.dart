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
                            if (imageHeight > 0)
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
                        Positioned(
                          top: 8,
                          left: 8,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            color: Colors.black,
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
                child: Column(
                  children: List.generate(
                    20,
                    (index) => ListTile(
                      textColor: Colors.white,
                      title: Text('Item $index'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
