
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'product_details_screen.dart';
import 'contact_us_screen.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({super.key});
  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products List"),
        actions: [
          IconButton(icon: const Icon(Icons.info), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsScreen())))
        ],
      ),
      body: FutureBuilder(
        future: dio.get("https://dummyjson.com/products"),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List products = snapshot.data!.data["products"];
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (ctx, index) {
                var item = products[index];
                return ListTile(
                  leading: Image.network(item['thumbnail'], width: 50),
                  title: Text(item['title']),
                  subtitle: Text("Price: \$${item['price']} (Discount: ${item['discountPercentage']}%)"),
                  onTap: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(product: item)));
                  },
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}