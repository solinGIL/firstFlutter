//다음 동작을 할 수 있도록 Book 클래스를 수정하시오.
//
//제목과 출간일이 같으면 같은 책으로 판단한다. 또한 List, Set, Map 등의 컬렉션에 넣어도 동일 객체로 판단한다.
//Book 인스턴스를 담고 있는 컬렉션에 대해 sort() 를 수행하여 출간일이 오래된 순서대로 정렬한다.
//deep copy 를 지원한다

class Book {
  String title;
  DateTime publishDate = DateTime.now();
  String comment;

  Book({
    required this.title,
    required this.comment,
    required this.publishDate,
  });

  factory Book.clone(Book book) {
    return Book(title: book.title, comment: book.comment, publishDate: book.publishDate);
  }

  Book copyWith({String? title, String? comment, DateTime? publishDate}) {
    return Book(
        title: title ?? this.title,
        comment: comment ?? this.comment,
        publishDate: publishDate ?? this.publishDate
    );
  }


  @override
  String toString() {
    return '$title, $comment, $publishDate';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Book &&
        title == other.title &&
        publishDate == other.publishDate;
  }

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

}

void main() {
  List<Book> books = [
    Book(title: '메이플스토리', comment: '추억의 책', publishDate: DateTime(2002, 01, 01, 09, 00)),
    Book(title: '으악 너무너무 무섭다', comment: '반납 안하는 책', publishDate: DateTime(2001, 12, 01, 24, 00)),
    Book(title: '메이플스토리', comment: '줄서서 봐야하는 책', publishDate: DateTime(2002, 01, 01, 09, 00)),
    Book(title: 'why?', comment: '지식인의 책', publishDate: DateTime(2003, 03, 01, 10, 00)),
  ];

  final book1 = books[0]; // 카피
  final book2 = Book.clone(book1);
  final book3 = book1.copyWith(comment: '재밌다'); // 카피한 곳 comment 수정

  print(books[0] == books[2]); // 제목과 출간일이 같으면 true반환하는지 확인

  print(book1.hashCode); // 해시코드 확인
  print(book2.hashCode);
  print(book3);


  books.sort((a, b) => a.publishDate.compareTo(b.publishDate));
  print('solt정렬: $books');

  for (var book in books) { // List books 출력
    print(book.title);
  }
}
