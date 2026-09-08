import 'package:flutter_application_1/model/modelbook.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Data {
  final supabase = Supabase.instance.client;

  Future<List<BookModel>> getAllBooks() async {
    final data = await supabase.from('books').select();

    List<BookModel> list = [];
    for (var element in data) {
      var item = BookModel.fromJson(element);
      list.add(item);
    }
    return list;
  }
}
