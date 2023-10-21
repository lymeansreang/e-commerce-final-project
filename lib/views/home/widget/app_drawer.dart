import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.85,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network('https://i.pinimg.com/564x/fb/c2/ae/fbc2aed72da2d6ccf5a46b926cddfb63.jpg',
                  fit: BoxFit.fill,),),

              accountName: Text('Ly Meansreang'),
              accountEmail: Text('lmsreang3@gmail.com')),

          ListTile(title: Text('Men'),leading: Icon(Icons.male),),
          ListTile(title: Text('Woman'),leading: Icon(Icons.female),),
          ListTile(title: Text('Setting'),leading: Icon(Icons.settings),),
          ListTile(title: Text('About Us'),leading: Icon(Icons.info_outline), ),
        ],
      ),
    );
  }
}
