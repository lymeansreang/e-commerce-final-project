import 'package:flutter/material.dart';

class FavProductCard extends StatelessWidget {
  const FavProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20,top: 20,left: 20),
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
                    child: Image.network('https://i.pinimg.com/564x/31/2d/f6/312df60d274b40aa695745e015bafed3.jpg',fit: BoxFit.fill,),)
              ),
              Positioned(
                top: 10,
                left: 20,
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(Icons.favorite,color: Colors.red,)),
              ),
              Positioned(
                top:10,
                right: 5,
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(100),),
                    child: Text("10% off")),),
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