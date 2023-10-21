import 'package:ecommerce/data/response/status.dart';
import 'package:ecommerce/models/ProductModel.dart';
import 'package:ecommerce/viewmodels/products_viewmodels.dart';
import 'package:ecommerce/views/home/widget/app_bar.dart';
import 'package:ecommerce/views/home/widget/app_drawer.dart';
import 'package:ecommerce/views/home/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _key= GlobalKey();
  final _productViewModel = ProductsViewModels();

  @override
  void initState() {
    super.initState();
    _productViewModel.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: MyAppBar(key: _key),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 70,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                color: Colors.grey.shade400,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search),
                      Text('Search product')
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: false,
            expandedHeight: 180,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network('https://i.pinimg.com/564x/41/fe/88/41fe88f445bbcaa29f2722236a66fcfc.jpg',),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                margin: const EdgeInsets.only(left: 15,top: 15),
                child: const Text('New Arrival',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),)),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 320,
              margin:const EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 15),
              child: ChangeNotifierProvider(
                create: (context) => _productViewModel,
                child: Consumer<ProductsViewModels>(
                  builder: (context, viewModel, _){
                    switch(viewModel.response.status) {
                      case Status.LOADING:
                        return CircularProgressIndicator();
                      case Status.COMPLETED:
                        ProductModel productModel = viewModel.response.data;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: productModel.data!.length,
                          itemBuilder: (context, index) {
                            // print('index = $index, ${productModel.data![index]}');
                            return ProductCard(product: productModel.data![index],);
                          },);
                      case Status.ERROR:
                        return Text('Error');
                      default: return Text('Processing');
                    }

                  },

                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                margin: const EdgeInsets.only(left: 15),
                child: const Text('Best Seller',
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              child: Container(
                margin:const EdgeInsets.only(left: 15,right: 15),
                child: const  Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(onPressed: null, child: Text('All',),),
                    SizedBox(width: 10,),
                    ElevatedButton(onPressed: null, child: Text('Adidas')),
                    SizedBox(width: 10,),
                    ElevatedButton(onPressed: null, child: Text('Nike')),
                    SizedBox(width: 10,),
                    ElevatedButton(onPressed: null, child: Text('New')),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 320,
              margin:const EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 15),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context,index){
                  return ProductCard();
                },),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          Text('T',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                          Text('O',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          Text('P',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          Text('10',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                            width: 250,height: 150,
                            child: Transform.rotate(
                                angle: 50,
                                child: Image.asset('asset/image/shoes.png',))),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      drawer: const MyDrawer(),
    );
  }
}
