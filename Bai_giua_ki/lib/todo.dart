class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Tập thể dục', isDone: true),
      ToDo(id: '02', todoText: 'Ăn sáng', isDone: true ),
      ToDo(id: '03', todoText: 'Check Emails', ),
      ToDo(id: '04', todoText: 'Họp Team', ),
      ToDo(id: '05', todoText: 'Học Tiếng Nhật', ),
      ToDo(id: '06', todoText: 'Chạy bộ', ),
    ];
  }
}