import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Error state widget
class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, color: Colors.red, size: 96),
          const SizedBox(
            height: 30,
          ),
          Text("Error occurred,try again", style: TextStyle(color: Colors.grey.shade500, fontSize: 24)),
        ],
      ),
    );
  }
}
