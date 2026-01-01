
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
  Dio dio = Dio(); // مكتبة Dio المستخدمة في أكوادك

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
        future: dio.get("https://dummyjson.com/products"), // الرابط المطلوب [cite: 9]
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List products = snapshot.data!.data["products"];
            return ListView.builder( // استخدام ListView.builder [cite: 22]
              itemCount: products.length,
              itemBuilder: (ctx, index) {
                var item = products[index];
                return ListTile(
                  leading: Image.network(item['thumbnail'], width: 50), // [cite: 23]
                  title: Text(item['title']), // [cite: 23]
                  subtitle: Text("Price: \$${item['price']} (Discount: ${item['discountPercentage']}%)"), // [cite: 23]
                  onTap: () {
                    // الانتقال للتفاصيل عند الضغط [cite: 24, 25]
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