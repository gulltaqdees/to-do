import 'package:flutter/material.dart';

class Search_Bar extends StatelessWidget {
  const Search_Bar({super.key, required this.onPress});
  final void Function(String) onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: TextField(
        onTap: () {},
        onChanged: onPress,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search, color: Colors.black, size: 20.0),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
