import 'package:flutter/material.dart';
import 'package:tracker_apps_v2/models/category.dart';
import 'package:tracker_apps_v2/models/icon.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TraccApp",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: GridView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: MediaQuery.of(context).size.height / 3.5),
        children: [
          ...categoryList
              .map((category) => InkWell(
                    onTap: () => Navigator.of(context).pushNamed("/$category"),
                    child: Card(
                      key: ValueKey(category),
                      elevation: 2,
                      color: Theme.of(context).colorScheme.surface,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(iconList[category]),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              category,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
