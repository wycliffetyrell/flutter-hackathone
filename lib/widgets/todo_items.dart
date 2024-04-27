import 'package:flutter/material.dart';
import 'package:todolist/model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final Function(ToDo) onToDoChanged;
  final Function(String) onDeleteItem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  // Map of mood emojis with lowercase keys for case-insensitive lookups
  static const Map<String, String> moodEmojis = {
    'happy': '😊',
    'sad': '😢',
    'angry': '😠',
    'productive': '🚀',
    'relaxed': '😌',
    // Add more moods and corresponding emojis as needed
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white12, // Set cream white background color
        borderRadius: BorderRadius.circular(15), // Add rounded corners
      ),
      child: ListTile(
        onTap: () => onToDoChanged(todo),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.blue,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              todo.todoText,
              style: TextStyle(
                fontSize: 16,
                color: todo.isDone ? Colors.grey[500] : Colors.black,
                decoration: todo.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            // Display mood emoji if mood exists in the map (case-insensitive)
            if (todo.mood != null)
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow, // Yellow background for the emoji
                ),
                child: Text(
                  moodEmojis[
                      todo.mood!.toLowerCase()]!, // Lowercase the mood key
                  style: TextStyle(
                    fontSize: 24, // Adjust the size of the emoji
                    color: Colors.black, // Black color for the emoji
                  ),
                ),
              ),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: () => onDeleteItem(todo.id),
            icon: const Icon(
              Icons.delete,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
