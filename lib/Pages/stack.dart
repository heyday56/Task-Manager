class MyStack<T> {
  final List<T> _items = [];

  void push(T item) => _items.add(item);

  T pop() => _items.removeLast();

  T get top => _items.isNotEmpty ? _items.last : throw Exception('Stack is empty');

  bool get isEmpty => _items.isEmpty;

  int get length => _items.length;

  List<T> get items => List.unmodifiable(_items);
}
