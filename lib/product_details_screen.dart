import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final dynamic product;
  const ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['title'])),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(product['thumbnail']), // [cite: 28]
            SizedBox(
              height: 120,
              child: ListView.builder( // عرض بقية الصور [cite: 28, 29]
                scrollDirection: Axis.horizontal,
                itemCount: product['images'].length,
                itemBuilder: (context, i) => Image.network(product['images'][i], width: 120),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product['title'], style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), // [cite: 27]
                  Text("Price: \$${product['price']}"), // [cite: 27]
                  Text("Discount: ${product['discountPercentage']}%"), // [cite: 27]
                  Text("Rating: ${product['rating']}"), // [cite: 27]
                  const SizedBox(height: 10),
                  Text(product['description']), // [cite: 27]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}