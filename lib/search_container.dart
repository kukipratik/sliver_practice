import 'package:flutter/material.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({Key? key}) : super(key: key);

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  bool expandSearch = true;
  bool isInitialColor = true;
  int selectedTag = 0;

  @override
  Widget build(BuildContext context) {
    const fillColor = Color.fromARGB(255, 104, 104, 104);
    // print("build again = $expandSearch ");
    List<String> dummyList = [
      "Top",
      "Playlists",
      "Songs",
      "Artists",
      "Profiles",
      "Albums",
      "Podcasts & Shows",
      "Episodes",
      "Genres & Moods"
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            SizedBox(
              height: 55,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 450),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: CurvedAnimation(
                        parent: animation, curve: Curves.easeInOut),
                    child: child,
                  );
                },
                child: !expandSearch
                    ? Padding(
                        key: const ValueKey<bool>(false),
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              expandSearch = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: fillColor,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            height: 45,
                            width: double.infinity,
                            child: const Center(
                              child: Text(
                                "Search",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : TextField(
                        key: const ValueKey<bool>(true),
                        onChanged: (value) {
                          // print("value = $value");
                          if (value == "") {
                            setState(() {
                              isInitialColor = true;
                            });
                          } else {
                            setState(() {
                              isInitialColor = false;
                            });
                          }
                        },
                        autofocus: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          fillColor: fillColor,
                          hintText: "Search query",
                          hintStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          filled: true,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                expandSearch = false;
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                // color: isInitialColor ? Colors.white : Colors.redAccent,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isInitialColor)
                      const Text(
                        "Recent searches",
                        style: TextStyle(color: Colors.white),
                      ),
                    if (!isInitialColor)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SizedBox(
                          height: 38,
                          child: ListView.builder(
                              itemCount: dummyList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedTag = index;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: selectedTag == index
                                            ? Colors.green
                                            : Colors.black,
                                        borderRadius: BorderRadius.circular(
                                            15.0), // Adjust the value as needed
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 10),
                                          child: Text(
                                            dummyList[index],
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
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
