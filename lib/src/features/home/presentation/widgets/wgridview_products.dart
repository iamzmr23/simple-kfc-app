import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kfc/src/data/entity/kfc_model.dart';
import 'package:kfc/src/features/home/controller/home_controller.dart';

class WGridviewProducts extends ConsumerWidget {
  const WGridviewProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeController);
    final con = ref.read(homeController);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        itemCount: con.currentList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: MediaQuery.of(context).size.height / 2.8, crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              final image = con.currentList[index]['image'];
              final title = con.currentList[index]['title'];
              final subtitle = con.currentList[index]['subtitle'];
              final count = con.currentList[index]['count'];
              final price = con.currentList[index]['price'];
              bool isProductExist = con.products.any((product) => product.title == title);
              if (!isProductExist) {
                con.products.add(KFCModel(image: image, title: title, subtitle: subtitle, count: count, price: price));
                con.saveProductList();
              }
              con.saveProductList();
            },
            child: SizedBox(
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 110,
                      width: double.maxFinite,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                          child: Image.network(con.currentList[index].data()['image'], fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(con.currentList[index].data()['title'],
                              textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            con.currentList[index].data()['subtitle'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        '${con.currentList[index].data()['price']} sum',
                        style: const TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
