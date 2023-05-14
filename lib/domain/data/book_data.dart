import 'package:mideterm_fail/domain/model/book_model.dart';

class BookData {
  static final List<Lesson> lessonsData = [
    Lesson(
      className: '1 класс, Математика 1 бөлүм',
      book: Book(
        bookImage:'assets/lesson/books/math_book_1_part_1.jpeg',
        bookName: 'Математика 1 класс 1 бөлүк.',
        pathBook: 'assets/lesson/books/math_book_part_1.pdf',
      ),
    ),
    Lesson(
      className: '1 класс, Математика 2 бөлүм',
      book: Book(
        bookImage: 'assets/lesson/books/math_book_1_part_2.jpeg',
        bookName: 'Математика 1 класс 2 бөлүм',
        pathBook: 'assets/lesson/books/math_book_part_2.pdf',
      ),
    ),
    Lesson(
      className: '2 класс, Математика',
      book: Book(
        bookImage: 'assets/lesson/books/math_book_2_1.jpeg',
        bookName: 'Математика 2 класс',
        pathBook: 'assets/lesson/books/math_book_2_1.pdf',
      ),
    ),

  ];
}
