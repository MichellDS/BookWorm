import 'package:bookworm/pages/details_page.dart';
import 'package:bookworm/pages/library_page.dart';
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
                builder: (context) => const DetailsBook(),
              ));
        },
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              cape ?? "",
              height: 200,
              width: 150,
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
                      overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold),
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
                        const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16 ),
                    child: Text(
                      description ?? "",
                      maxLines: 5,
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
                      overflow: TextOverflow.ellipsis, style: TextStyle(fontStyle: FontStyle.italic),
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
