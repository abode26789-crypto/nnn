import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/modelbook.dart';
import 'package:flutter_application_1/service/data.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Books')),
      body: FutureBuilder<List<BookModel>>(
        future: Data().getAllBooks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final books = snapshot.data ?? <BookModel>[];
          if (books.isEmpty) {
            return const Center(child: Text('No books found'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: books.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final book = books[index];
              return Card(
                child: ListTile(
                  leading: book.image == null || book.image!.isEmpty
                      ? const Icon(Icons.book)
                      : Image.asset(
                          book.image!,
                          width: 56,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.book),
                        ),
                  title: Text(book.title ?? 'Untitled'),
                  subtitle: Text(book.author ?? 'Unknown author'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
