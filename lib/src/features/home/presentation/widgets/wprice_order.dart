import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kfc/src/features/home/controller/home_controller.dart';
import 'package:lottie/lottie.dart';

class WPriceandOrder extends ConsumerWidget {
  const WPriceandOrder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeController);
    final con = ref.read(homeController);
    int totalPrice = con.calculateTotalPrice();
    var time = DateTime.now();
    return Expanded(
      flex: 1,
      child: SizedBox(
        width: double.maxFinite,
        child: DecoratedBox(
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$totalPrice sum", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.red)),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              LottieBuilder.asset(
                                'assets/animations/success_lottie.json',
                                width: 100,
                                repeat: false,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: con.products.map((product) {
                                  return Text(
                                      "Product name: ${product.title} \nCount: ${product.count} \nPrice: ${product.count * int.parse(product.price)} sum");
                                }).toList(),
                              ),
                              const SizedBox(height: 16),
                              Text("Total amount: $totalPrice sum \nDate Time: $time"),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                // Mahsulotlar ro'yxatini tozalash
                                con.clearProducts();
                                // AlertDialogni yopish
                                Navigator.of(context).pop();
                              },
                              child: const Text('Delete'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[300]),
                  child: const Text("Check Out", style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
