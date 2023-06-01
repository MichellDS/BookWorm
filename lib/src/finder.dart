// library google_books;

// import 'dart:convert';

// import 'package:bookworm/models/mybooks.dart';
// // ignore: depend_on_referenced_packages
// import 'package:http/http.dart' as http;

// export 'package:bookworm/models/mybooks.dart';

// Future<List<MyBook>> queryBooks(
//   String query, {
//   QueryType? queryType,
//   String? langRestrict,
//   int maxResults = 10,
//   OrderBy? orderBy,
//   PrintType? printType = PrintType.all,
//   int startIndex = 0,
//   bool reschemeImageLinks = false,
// }) async {
//   assert(query.isNotEmpty);

//   // assert(startIndex <= maxResults);

//   var url = 'https://www.googleapis.com/books/v1/volumes?q=';

//   if (queryType != null) url += '${queryType.name}:';

//   var q = '$url'
//       '${query.trim().replaceAll(' ', '+')}'
//       '&maxResults=$maxResults'
//       '&startIndex=$startIndex';

//   if (langRestrict != null) q += '&langRestrict=$langRestrict';
//   if (orderBy != null) {
//     q += '&orderBy=${orderBy.toString().replaceAll('OrderBy.', '')}';
//   }
//   if (printType != null) {
//     q += '&printType=${printType.toString().replaceAll('PrintType.', '')}';
//   }
//   final result = await http.get(Uri.parse(q));
//   if (result.statusCode == 200) {
//     final books = <MyBook>[];
//     final list = (jsonDecode(result.body))['items'] as List<dynamic>?;
//     if (list == null) return [];
//     for (final e in list) {
//       books.add(MyBook.fromJson(e, reschemeImageLinks: reschemeImageLinks));
//     }
//     return books;
//   } else {
//     throw (result.body);
//   }
// }

// enum QueryType {
//   intitle,
//   inauthor,
//   inpublisher,
//   subject,
//   isbn,
//   lccn,
//   oclc,
// }

// enum OrderBy {
//   newest,
//   relevance,
// }

// enum PrintType {
//   all,
//   books,
//   magazines,
// }

// Future<MyBook> getSpecificBook(
//   String id, {
//   bool reschemeImageLinks = false,
// }) async {
//   assert(id.isNotEmpty, 'You must provide a valid id');
//   final q = 'https://www.googleapis.com/books/v1/volumes/${id.trim()}';
//   final result = await http.get(Uri.parse(q));
//   if (result.statusCode == 200) {
//     return MyBook.fromJson(
//       jsonDecode(result.body) as Map<String, dynamic>,
//       reschemeImageLinks: reschemeImageLinks,
//     );
//   } else {
//     throw (result.body);
//   }
// }

import 'dart:convert';

// ignore: implementation_imports
import 'package:google_books_api/src/enums/enums.dart';

// ignore: implementation_imports
import 'package:google_books_api/src/models/models.dart' show BookInfo;
import 'package:http/http.dart' as http;

class GoogleBooksApi {
  const GoogleBooksApi();

  Future<List<BookInfo>> searchBooks(
    String query, {
    QueryType? queryType,
    String? langRestrict,
    int maxResults = 30,
    OrderBy? orderBy,
    PrintType? printType = PrintType.all,
    int startIndex = 0,
  }) async {
    var queryUrl = "https://www.googleapis.com/books/v1/volumes?q="
        "${queryType != null ? queryType.name + ':' + query.trim().replaceAll(' ', '+') : query.trim().replaceAll(' ', '+')}"
        "&maxResults=$maxResults"
        "&startIndex=$startIndex"
        "${langRestrict != null ? '&langRestrict=$langRestrict' : ''}"
        "${orderBy != null ? '&orderBy=${orderBy.name}' : ''}"
        "${printType != null ? '&printType=${printType.name}' : ''}";

    final List<BookInfo> books = [];

    await http.get(Uri.parse(queryUrl)).then((result) {
      if (result.statusCode == 200) {
        ((jsonDecode(result.body))['items'] as List<dynamic>?)?.forEach((item) {
          books.add(BookInfo.fromJson(item));
        });
      } else {
        throw SearchFailedException;
      }
    });

    return books;
  }

  Future<BookInfo> getBookById(String id) async {
    final query = 'https://www.googleapis.com/books/v1/volumes/${id.trim()}';

    late BookInfo book;
    await http.get(Uri.parse(query)).then((result) {
      if (result.statusCode == 200) {
        book = BookInfo.fromJson(jsonDecode(result.body));
      } else {
        throw BookNotFoundException;
      }
    });

    return book;
  }
}

class BookNotFoundException implements Exception {}

class SearchFailedException implements Exception {}
