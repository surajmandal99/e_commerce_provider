import 'package:e_commerce_provider/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    var favoritelList = provider.favorites;
    return Scaffold(
        body: Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, top: 20),
          child: Row(
            children: [
              Text(
                "Favorites",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: favoritelList.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            favoritelList.removeAt(index);
                            setState(() {});
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: "Delete",
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ListTile(
                          title: Text(favoritelList[index].name),
                          subtitle: Text(favoritelList[index].description),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                              favoritelList[index].image,
                            ),
                            backgroundColor: Colors.red.shade200,
                          ),
                          trailing: Text(
                            '\$${favoritelList[index].price}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          // tileColor: Colors.green,
                        ),
                      ),
                    ),
                  );
                }))
      ],
    ));
  }
}
