import 'package:flutter/material.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  List<Map<String, List<String>>> dummy = [
    {
      "Top": [
        "For You",
        "Recommended",
        "Got you",
        "Hello",
        "How",
        "Why",
      ]
    },
    {
      "Playlists": ["Dummy1", "Dummy2", "Dummy3"]
    },
    {
      "Songs": ["For You", "Recommended", "Got you"]
    },
    {
      "Artists": ["For You", "Recommended", "Got you"]
    },
    {
      "Profiles": ["For You", "Recommended", "Got you"]
    },
    {
      "Albums": ["For You", "Recommended", "Got you"]
    },
  ];

  int selectedIndex = -1;
  List<String> selectedTags = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            const Center(
              child: Text(
                "Appbar",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14),
              child: SizedBox(
                height: 38,
                child: selectedIndex == -1
                    ? ListView.builder(
                        itemCount: dummy.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          String title = dummy[index].keys.first;
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                  selectedTags.add(title);
                                });
                              },
                              child: (Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15.0),
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
                                      title,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              )),
                            ),
                          );
                        },
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = -1;
                                    selectedTags = [];
                                  });
                                },
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Colors.white,
                                )),
                            // const SizedBox(width: 8),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  children:
                                      selectedTags.asMap().entries.map((entry) {
                                    final index = entry.key;
                                    final title = entry.value;
                                    final isLast =
                                        index == selectedTags.length - 1;

                                    return Padding(
                                      padding: EdgeInsets.only(
                                          right: isLast ? 0.0 : 8.0),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (title !=
                                                    dummy[selectedIndex]
                                                        .keys
                                                        .first) {
                                                  selectedTags.remove(title);
                                                }
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 16.0,
                                                vertical: 10,
                                              ),
                                              child: Text(
                                                title,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                          if (!isLast)
                                            Container(
                                              color: Colors.black,
                                              width: 0.3,
                                              height: double.infinity,
                                            ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            Row(
                              children: dummy[selectedIndex]
                                  .values
                                  .first
                                  .map((title) {
                                // print("title = $title");
                                // print("sel = $selectedTags");
                                if (selectedTags.contains(title)) {
                                  return Container();
                                }
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedTags.add(title);
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0,
                                            vertical: 10,
                                          ),
                                          child: Text(
                                            title,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
