import 'package:ecommerce/main.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  const MyAppBar({
    required GlobalKey<ScaffoldState> key,
  }) : _key = key;

  final GlobalKey<ScaffoldState> _key;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Shop Your Fav',
        style: const TextStyle(fontWeight: FontWeight.w700),),
      leading: IconButton(onPressed: (){
        // Scaffold.of(context).openDrawer();
        _key.currentState!.openDrawer();
      },
        icon: Icon(Icons.dehaze),),
      centerTitle: true,
      actions: const [
        Icon(Icons.notifications_outlined),
        SizedBox(width: 20,)
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>const Size.fromHeight(50);
}
