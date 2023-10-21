import 'package:ecommerce/models/ProductModel.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {

  Datum? product;

  ProductCard({
    this.product
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * .60,
                  height: 220,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                          'https://cms.istad.co ${product!.attributes!.category!.data!.attributes!.iconUrl!}',fit: BoxFit.fill,))),
              Positioned(
                  bottom:10,
                  right: 5,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(Icons.favorite_border_outlined,),
                  )),
            ],
          ),
          SizedBox(height: 10,),
          SizedBox(
            width: MediaQuery.of(context).size.width * .60,
            child: const Text('Adidas Forum Low',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          Text('Man Shoes'),
          Text('\$100'),
        ],
      ),
    );
  }
}