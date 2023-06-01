// ignore_for_file: file_names

import 'package:bookworm/pages/library_page.dart';
import 'package:flutter/foundation.dart';
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
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LibraryPage(),
              ));
        },
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              cape ??
                  "https://i.pinimg.com/originals/fc/a7/35/fca735f1b45049fd58cebf23e249edc9.jpg",
              height: 150,
              width: 100,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.image_not_supported,
                  size: 100,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
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
                      subtitle ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Text(
                      description ?? "",
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
                      authors ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                    child: Text(
                      categories ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
