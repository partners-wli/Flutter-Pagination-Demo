import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Empty state widget
class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: "https://cdn.iconscout.com/icon/premium/png-256-thumb/ban-product-2545910-2128154.png",
            height: 200,
          ),
          const SizedBox(
            height: 30,
          ),
          Text("No products available", style: TextStyle(color: Colors.grey.shade500, fontSize: 24)),
        ],
      ),
    );
  }
}
