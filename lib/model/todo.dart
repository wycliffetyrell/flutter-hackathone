// This class represents a single Todo item with an ID, task text, and completion status.
class ToDo {
  String id; // Unique identifier for the todo item
  String todoText; // Text content of the todo item
  bool
      isDone; // Completion status of the todo item (true if completed, false otherwise)
  String? mood; // tracks todo

  // Constructor for the ToDo class, with required parameters for id and todoText,
  // and an optional parameter for isDone with a default value of false.
  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
    this.mood,
  });

  // Optional method to set mood for an existing task object
  void setMood(String mood) {
    this.mood = mood;
  }

  // A static method to generate a list of predefined ToDo items.
  // This is a factory method used to create a list of sample ToDo items.
  static List<ToDo> todoList() {
    // Return a list of ToDo items with predefined properties.
    return [
      ToDo(
          id: '1',
          todoText: 'Buy groceries',
          isDone: true,
          mood: 'happy'), // A completed task

      ToDo(
          id: '2',
          todoText: 'Call classmate',
          mood: 'sad'), // An incomplete task
      ToDo(
          id: '3',
          todoText: 'Call Lecturer',
          mood: 'productive'), // An incomplete task
      ToDo(
          id: '4',
          todoText: 'Call sister',
          mood: 'relaxed'), // An incomplete task
    ];
  }
}

class User {
  String username;
  String password;

  User({required this.username, required this.password});
}
