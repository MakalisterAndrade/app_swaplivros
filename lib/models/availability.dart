import 'package:app_swaplivros/models/book.dart';
import 'package:app_swaplivros/models/user.dart';

class Availability {
  final String _id;
  final Book book;
  final User user;
  final DateTime createdAt;
  final BookAvailableType availableType;

  Availability({
    required String id,
    required this.book,
    required this.user,
    required this.createdAt,
    required this.availableType,
  }) : _id = id;

  String get id => _id;
}
