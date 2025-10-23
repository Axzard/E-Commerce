import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../models/product_model.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  
  List<ProductModel> favoriteItems = productList
      .where((item) => item.isFav)
      .toList(); 

  Map<String, int> quantities = {}; 

  @override
  void initState() {
    super.initState();
    for (var item in favoriteItems) {
      quantities[item.name] = 1; 
    }
  }

  void increaseQty(ProductModel product) {
    setState(() {
      quantities[product.name] = (quantities[product.name] ?? 1) + 1;
    });
  }

  void decreaseQty(ProductModel product) {
    setState(() {
      if ((quantities[product.name] ?? 1) > 1) {
        quantities[product.name] = (quantities[product.name]! - 1);
      }
    });
  }

  void removeItem(ProductModel product) {
    setState(() {
      favoriteItems.remove(product);
      quantities.remove(product.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Favorites",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          final product = favoriteItems[index];
          final qty = quantities[product.name] ?? 1;

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Slidable(
              key: ValueKey(product.name),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                extentRatio: 0.22,
                children: [
                  SlidableAction(
                    onPressed: (context) => removeItem(product),
                    icon: Icons.delete,
                    backgroundColor: Colors.redAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: product.bgColor,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(product.image),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\$${product.price.toStringAsFixed(2)} x 4",
                            style: TextStyle(
                              color: Colors.green.shade600,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            product.unit,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),

                    
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () => increaseQty(product),
                          child: Icon(Icons.add,
                              color: Colors.green.shade600, size: 20),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          qty.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.grey
                          ),
                        ),
                        const SizedBox(height: 6),
                        GestureDetector(
                          onTap: () => decreaseQty(product),
                          child: Icon(Icons.remove,
                              color: Colors.green.shade600, size: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
