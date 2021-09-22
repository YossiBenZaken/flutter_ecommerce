import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/pages/product_detail.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85
    },
    {
      "name": "Red dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50
    },
    {
      "name": "Hills",
      "picture": "images/products/hills1.jpeg",
      "old_price": 100,
      "price": 50
    },
    {
      "name": "Pants",
      "picture": "images/products/pants2.jpeg",
      "old_price": 100,
      "price": 50
    },
    {
      "name": "Skt",
      "picture": "images/products/skt1.jpeg",
      "old_price": 100,
      "price": 50
    }
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Single_prod(
          product: product_list[index],
        );
      },
    );
  }
}

class Single_prod extends StatelessWidget {
  final product;
  Single_prod({required this.product});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: product['name'],
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetails(
                      product: product,
                    ))),
            child: GridTile(
              footer: Container(
                  color: Colors.white,
                  child: Row(children: [
                    Expanded(
                      child: Text(
                        product['name'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Text(
                      "\$${product['price']}",
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    )
                  ])),
              child: Image.asset(
                product['picture'],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
