import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const HomeCard({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.all(16.0),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ),
      ),
    );
  }
}
