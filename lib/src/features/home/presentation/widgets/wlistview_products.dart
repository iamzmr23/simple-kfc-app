import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kfc/src/features/home/controller/home_controller.dart';

class WlistViewProducts extends ConsumerWidget {
  const WlistViewProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeController);
    final con = ref.read(homeController);
    return Expanded(
      flex: 5,
      child: con.products.isNotEmpty
          ? ListView.builder(
              itemCount: con.products.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: SizedBox(
                    height: 120,
                    width: double.maxFinite,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300], borderRadius: const BorderRadius.horizontal(left: Radius.circular(16))),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.horizontal(left: Radius.circular(16)),
                                      child: Image.network(con.products[index].image, fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(height: 16),
                                      Text(
                                        con.products[index].title,
                                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "${con.products[index].price} sum",
                                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.red),
                                      ),
                                      const SizedBox(height: 16),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          style: IconButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              minimumSize: const Size(18, 18),
                                              shadowColor: Colors.black,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                          icon: const Icon(CupertinoIcons.xmark, size: 20, color: Colors.red),
                                          onPressed: () {
                                            con.deleteProduct(index);
                                            con.saveProductList();
                                          }),
                                      const Spacer(),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          //! MINUS
                                          IconButton(
                                              style: IconButton.styleFrom(
                                                  backgroundColor: Colors.white, minimumSize: const Size(18, 18), shadowColor: Colors.black),
                                              icon: const Icon(CupertinoIcons.minus, size: 20, color: Colors.black),
                                              onPressed: () {
                                                con.decrementCount(index);
                                              }),
                                          //! COUNT
                                          Text("${con.products[index].count}"),
                                          //! PLUS
                                          IconButton(
                                              style: IconButton.styleFrom(
                                                  backgroundColor: Colors.white, minimumSize: const Size(18, 18), shadowColor: Colors.black),
                                              icon: const Icon(CupertinoIcons.plus, size: 20, color: Colors.black),
                                              onPressed: () {
                                                con.incrementCount(index);
                                              }),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
          : const Center(
              child: Text('No Products'),
            ),
    );
  }
}
