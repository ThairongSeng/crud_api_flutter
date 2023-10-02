
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(color: Colors.pinkAccent),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius:40,
                    backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5i2AI7hIPg_tDeSiIR6fWMKducPdqmeILFA&usqp=CAU"),
                  ),
                  Text("Thairong Seng", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize: 22),),
                ],
              )
          ),
          const ListTile(
            leading: Icon(Icons.book, color: Colors.pink),
            title: Text("Become a pandapro"),
            // onTap: (){
            //   Navigator.push(context, MaterialPageRoute(builder: (context) => Favorite()));
            // },
          ),
          ListTile(
            leading: const Icon(Icons.shield_moon_outlined, color: Colors.pinkAccent,),
            title: const Text("Vouchers & offers"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border_outlined, color: Colors.pinkAccent,),
            title: const Text("Favourites"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.pages_outlined, color: Colors.pinkAccent),
            title: const Text("Orders & reordering"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.pinkAccent),
            title: const Text("View profile"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.description, color: Colors.pinkAccent),
            title: const Text("Addresses"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.pinkAccent),
            title: const Text("Payment methods"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.pinkAccent),
            title: const Text("panda rewards"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.pinkAccent),
            title: const Text("Help center"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.gif_box, color: Colors.pinkAccent),
            title: const Text("Invite friends"),
            onTap: () {},
          ),
          const ListTile(
            leading: Icon(Icons.more_horiz_outlined, color: Colors.pinkAccent,),
            title: Text("More"),
          )
        ],
      ),
    );
  }
}
