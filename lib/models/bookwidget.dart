// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  const BookWidget(
      {super.key,
      this.title,
      this.subtitle,
      this.cape,
      this.authors,
      this.categories,
      this.description});

  final dynamic title, subtitle, cape, authors, categories, description;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
      elevation: 8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const ColoredBox(
          //   color: Colors.black,
          //   child: SizedBox(
          //     height: 150,
          //     width: 100,
          //   ),
          // ),
          Image.network(
            cape ?? "",
            height: 150,
            width: 100,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Text(
                    title ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 4, bottom: 16),
                  child: Text(
                    subtitle ?? "subtitle",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Text(
                    description ??
                        "descriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescription",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                  child: Text(
                    authors ?? "authors, authors",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                  child: Text(
                    categories ?? "categories, categories",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    selectionColor: Colors.amber,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
