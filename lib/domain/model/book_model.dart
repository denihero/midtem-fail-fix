class Lesson{
  final String className;
  final Book book;

  Lesson({required this.className, required this.book});
}

class Book{
  final String bookName;
  final String bookImage;
  final String pathBook;

  Book({required this.bookImage,required this.bookName, required this.pathBook});
}